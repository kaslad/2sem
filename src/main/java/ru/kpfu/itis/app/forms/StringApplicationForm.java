package ru.kpfu.itis.app.forms;

import lombok.*;
import ru.kpfu.itis.app.model.StringApplication;
import ru.kpfu.itis.app.model.Stringer;
import ru.kpfu.itis.app.model.enums.RacquetString;
import ru.kpfu.itis.app.model.enums.StringApplicationState;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class StringApplicationForm{
    private Short horizontalWeight;
    private Short verticalWeight;
    private StringApplicationState state;
    private String name;
    private RacquetString racquetString;

}
