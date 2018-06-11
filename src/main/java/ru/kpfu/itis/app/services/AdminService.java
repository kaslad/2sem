package ru.kpfu.itis.app.services;


import ru.kpfu.itis.app.model.User;

import java.util.List;

public interface AdminService {
    List<User> getAllUsers();

    void createTempPassword(Long userId);
}
