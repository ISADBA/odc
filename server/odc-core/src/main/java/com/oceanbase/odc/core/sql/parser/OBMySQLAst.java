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

package com.oceanbase.odc.core.sql.parser;

import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.Parser;
import org.antlr.v4.runtime.tree.ParseTree;

import com.oceanbase.tools.dbbrowser.parser.PLParser;
import com.oceanbase.tools.dbbrowser.parser.SqlParser;
import com.oceanbase.tools.dbbrowser.parser.constant.SqlType;
import com.oceanbase.tools.dbbrowser.parser.result.BasicResult;
import com.oceanbase.tools.sqlparser.BaseSQLParser;
import com.oceanbase.tools.sqlparser.OBMySQLParser;

import lombok.NonNull;

/**
 * {@link OBMySQLAst}
 *
 * @author yh263208
 * @date 2023-11-17 15:57
 * @since ODC_release_4.2.3
 */
class OBMySQLAst extends BaseAst {

    public OBMySQLAst(@NonNull ParseTree root,
            @NonNull BaseSQLParser<? extends Lexer, ? extends Parser> from) {
        super(root, from);
    }

    @Override
    public BasicResult getParseResult() {
        try {
            if (this.from instanceof OBMySQLParser) {
                return SqlParser.parseMysql(getRoot());
            } else if (this.from instanceof OBMySQLPLParser) {
                return PLParser.parseObMysql(getRoot());
            }
            return new BasicResult(SqlType.UNKNOWN);
        } catch (Exception e) {
            return new BasicResult(SqlType.UNKNOWN);
        }
    }

}
