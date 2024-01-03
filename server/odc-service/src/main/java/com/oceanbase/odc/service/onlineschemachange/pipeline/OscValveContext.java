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
package com.oceanbase.odc.service.onlineschemachange.pipeline;

import com.oceanbase.odc.core.session.ConnectionSession;
import com.oceanbase.odc.metadb.schedule.ScheduleEntity;
import com.oceanbase.odc.metadb.schedule.ScheduleTaskEntity;
import com.oceanbase.odc.service.connection.model.ConnectionConfig;
import com.oceanbase.odc.service.onlineschemachange.model.LinkType;
import com.oceanbase.odc.service.onlineschemachange.model.OnlineSchemaChangeParameters;
import com.oceanbase.odc.service.onlineschemachange.model.OnlineSchemaChangeScheduleTaskParameters;

import lombok.Data;

/**
 * @author yaobin
 * @date 2023-06-10
 * @since 4.2.0
 */
@Data
public class OscValveContext implements ValveContext {

    private Long projectId;
    private ScheduleEntity schedule;
    private ScheduleTaskEntity scheduleTask;
    private LinkType linkType;

    private ConnectionSession connectionSession;

    private ConnectionConfig connectionConfig;

    private OnlineSchemaChangeParameters parameter;

    private OnlineSchemaChangeScheduleTaskParameters taskParameter;

    private boolean swapSucceedCallBack;
}
