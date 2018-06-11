package ru.kpfu.itis.app.utils;

import com.sun.tools.javac.util.Pair;
import lombok.*;
import ru.kpfu.itis.app.model.Coach;
import ru.kpfu.itis.app.model.User;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
@EqualsAndHashCode
public class AjaxResponseBody {

    String msg;

    List<Pair<Coach, User>> result;

    public static void main(String[] args) {
    }



}
