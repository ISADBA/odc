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
package com.oceanbase.odc.core.sql.execute.mapper;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;

import org.springframework.util.StreamUtils;

import com.oceanbase.tools.dbbrowser.model.datatype.DataType;

import lombok.NonNull;

public class OracleBinaryNumberMapper implements JdbcColumnMapper {
    @Override
    public Object mapCell(@NonNull CellData data) throws SQLException, IOException {
        InputStream binaryStream = data.getBinaryStream();
        if (binaryStream == null) {
            return null;
        }
        return StreamUtils.copyToString(binaryStream, StandardCharsets.UTF_8);
    }

    @Override
    public boolean supports(@NonNull DataType dataType) {
        return "BINARY_FLOAT".equalsIgnoreCase(dataType.getDataTypeName()) ||
                "BINARY_DOUBLE".equalsIgnoreCase(dataType.getDataTypeName());
    }
}
