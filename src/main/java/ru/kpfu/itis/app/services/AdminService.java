package ru.kpfu.itis.app.services;


import ru.kpfu.itis.app.model.User;

import java.util.List;

/**
 * 17.11.2017
 * AdminService
 *
 * @author Sidikov Marsel (First Software Engineering Platform)
 * @version v1.0
 */
public interface AdminService {
    List<User> getAllUsers();

    void createTempPassword(Long userId);
}
