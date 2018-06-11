package ru.kpfu.itis.app.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.app.forms.StringApplicationEditStatusForm;
import ru.kpfu.itis.app.forms.StringApplicationForm;
import ru.kpfu.itis.app.model.Client;
import ru.kpfu.itis.app.model.StringApplication;
import ru.kpfu.itis.app.model.Stringer;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.model.enums.RacquetString;
import ru.kpfu.itis.app.model.enums.StringApplicationState;
import ru.kpfu.itis.app.repositories.StringApplicationRepository;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class StringApplicationServiceImpl implements StringApplicationService {
    @Autowired
    StringApplicationRepository stringApplicationRepository;
    @Autowired
    ClientService clientService;
    @Autowired
    AuthenticationService authenticationService;
    @Autowired
    StringerService stringerService;
    @Override
    public void create(StringApplicationForm form, Authentication authentication) {
        Client client = clientService.getDataByUser(authenticationService.getUserByAuthentication(authentication)).get();
        StringApplication newApplication = StringApplication.builder()
                .horizontalWeight(form.getHorizontalWeight())
                .client(client)
                .verticalWeight(form.getVerticalWeight())
                .racquetString(form.getRacquetString())
                .timeStart(new Timestamp(System.currentTimeMillis()))
                .state(StringApplicationState.NEW)
                .name(form.getName())
                .build();
        stringApplicationRepository.save(newApplication);

    }

    @Override
    public Optional<StringApplication> getById(Long id) {
        return stringApplicationRepository.findOneById(id);
    }

    @Override
    public List<StringApplication> getStringApplicationByStateAndClient(StringApplicationState state, Client client) {
        return stringApplicationRepository.findAllByClientAndState(client, state);
    }

    @Override
    public List<StringApplication> getStringApplicationByStringerAndState(Stringer stringer, StringApplicationState state) {
        return stringApplicationRepository.findAllByStringerAndState(stringer, state);
    }

    @Override
    public List<StringApplication> getStringApplicationByState(StringApplicationState state) {
        return stringApplicationRepository.getStringApplicationsByState(state);
    }

    @Override
    public void changeApplicationState(StringApplicationEditStatusForm form) {
        return ;
    }

    @Override
    public void changeApplicationState(Long id, StringApplicationState state, User user) {
        StringApplication application = stringApplicationRepository.findOneById(id).orElseThrow(
                () -> new IllegalArgumentException("String Application: " + id + " not found.")
        );

        application.setStringer(stringerService.findOneByUser(user));
        StringApplicationState newState = application.getState();
        if (newState == StringApplicationState.NEW) {
            newState = StringApplicationState.PROGRESS;
        } else if (newState == StringApplicationState.PROGRESS) {
            newState = StringApplicationState.REVIEW;
        } else if (newState == StringApplicationState.REVIEW) {
            newState = StringApplicationState.CANCELLED;
        }
        application.setState(newState);
        stringApplicationRepository.save(application);
    }

    @Override
    public List<StringApplication> getStringApplicationsByStringer(Stringer stringer) {
        return stringApplicationRepository.findAllByStringer(stringer);
    }

}
