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
package com.oceanbase.odc.core.shared.constant;

import java.util.Locale;

import org.springframework.context.i18n.LocaleContextHolder;

import com.oceanbase.odc.common.i18n.Translatable;

/**
 * 连接账号类型
 */
public enum ConnectionAccountType implements Translatable {
    /**
     * 主账号，一般具有读写权限
     */
    MAIN,
    /**
     * 只读账号，用于只读权限用户
     */
    READONLY,
    /**
     * 系统租户读账号，用于导入导出和分区元数据库获取，具有 sys 租户读权限
     */
    SYS_READ;

    @Override
    public String code() {
        return name();
    }

    public String getLocalizedMessage() {
        Locale locale = LocaleContextHolder.getLocale();
        return translate(null, locale);
    }
}
