package ru.kpfu.itis.app.forms;

import lombok.*;
import ru.kpfu.itis.app.model.enums.StringApplicationState;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class StringApplicationEditStatusForm {
    private Long applicationId;
    private StringApplicationState state;
}
