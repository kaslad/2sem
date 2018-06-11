package ru.kpfu.itis.app.services;

import org.springframework.security.core.Authentication;
import ru.kpfu.itis.app.forms.StringApplicationEditStatusForm;
import ru.kpfu.itis.app.forms.StringApplicationForm;
import ru.kpfu.itis.app.model.Client;
import ru.kpfu.itis.app.model.StringApplication;
import ru.kpfu.itis.app.model.Stringer;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.model.enums.StringApplicationState;

import java.util.List;
import java.util.Optional;

public interface StringApplicationService {

    void create(StringApplicationForm form, Authentication authentication);
    Optional<StringApplication> getById(Long Id);

    List<StringApplication> getStringApplicationByStateAndClient(StringApplicationState state, Client client);

    List<StringApplication> getStringApplicationByStringerAndState(Stringer stringer, StringApplicationState state);

    List<StringApplication> getStringApplicationByState(StringApplicationState state);
    void changeApplicationState(StringApplicationEditStatusForm form);

    void changeApplicationState(Long id, StringApplicationState state, User userByAuthentication);

    List<StringApplication> getStringApplicationsByStringer(Stringer stringer);

}
