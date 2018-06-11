package ru.kpfu.itis.app.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.app.forms.UserEditForm;
import ru.kpfu.itis.app.model.Stringer;
import ru.kpfu.itis.app.model.User;
import ru.kpfu.itis.app.repositories.StringerRepository;

import java.util.Optional;

@Service
public class StringerServiceImpl implements StringerService {
    @Autowired
    private StringerRepository stringerRepository;
    @Override
    public Stringer findOneByUser(User user) {
        return stringerRepository.findOneByUser(user).get();
    }

    @Override
    public Optional<Stringer> getDataByUser(User userByAuthentication) {
        return  stringerRepository.findOneByUser(userByAuthentication);
    }

    @Override
    public void updateInfo(UserEditForm userEditForm, Stringer stringer) {
        stringer.setPrice(userEditForm.getPrice());
        stringerRepository.save(stringer);
    }

    @Override
    public void register(User user) {
        Stringer stringer = Stringer.builder()
                .price("0")
                .user(user)
                .build();
        stringerRepository.save(stringer);

    }

}
