package ru.kpfu.itis.app.forms;


import lombok.*;
import ru.kpfu.itis.app.model.enums.PlayerDegree;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ClientEditForm extends UserEditForm {
    private PlayerDegree playerDegree;
}
