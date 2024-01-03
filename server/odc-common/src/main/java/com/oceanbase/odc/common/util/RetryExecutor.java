/*
 * Copyright (c) 2023 OceanBase.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.oceanbase.odc.common.util;

import java.util.Optional;
import java.util.concurrent.TimeUnit;
import java.util.function.Predicate;
import java.util.function.Supplier;

import lombok.Builder;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

/**
 * {@link RetryExecutor}
 *
 * @author yh263208
 * @date 2022-05-20 17:21
 * @since ODC_release_3.3.1
 */
@Getter
@Setter
@Builder
@Slf4j
public class RetryExecutor {

    @Builder.Default
    private int retryTimes = 1;
    @Builder.Default
    private long retryIntervalMillis = 0;
    @Builder.Default
    private boolean initialDelay = false;

    public <T> Optional<T> run(@NonNull Supplier<T> supplier, @NonNull Predicate<T> exitPredicate) {
        int count = retryTimes;
        if (count < 0) {
            throw new IllegalArgumentException("RetryTimes is illegal " + retryTimes);
        }
        if (initialDelay && retryIntervalMillis > 0 && retryTimes > 0) {
            try {
                busyWaiting(retryIntervalMillis, TimeUnit.MILLISECONDS);
            } catch (InterruptedException e) {
                log.warn("RetryExecutor is interrupted", e);
                return Optional.empty();
            }
        }
        while ((count--) > 0) {
            T target = supplier.get();
            if (exitPredicate.test(target)) {
                if (target != null) {
                    return Optional.of(target);
                }
                return Optional.empty();
            }
            if (retryIntervalMillis > 0) {
                try {
                    busyWaiting(retryIntervalMillis, TimeUnit.MILLISECONDS);
                } catch (InterruptedException e) {
                    log.warn("RetryExecutor is interrupted", e);
                    return Optional.empty();
                }
            }
        }
        return Optional.empty();
    }

    private void busyWaiting(long time, @NonNull TimeUnit timeUnit) throws InterruptedException {
        long waitingTime = TimeUnit.MILLISECONDS.convert(time, timeUnit);
        long destTimtstamp = System.currentTimeMillis() + waitingTime;
        while (!Thread.currentThread().isInterrupted()) {
            if (System.currentTimeMillis() - destTimtstamp > 0) {
                break;
            }
        }
        if (Thread.currentThread().isInterrupted()) {
            throw new InterruptedException();
        }
    }

}
