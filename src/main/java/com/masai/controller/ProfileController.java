package com.masai.controller;

import ch.qos.logback.core.model.Model;
import com.masai.model.User;
import com.masai.service.IUserServiceImpl;
import org.springframework.web.bind.annotation.RequestMapping;

public class ProfileController {

    @RequestMapping(value = "/profile")
    public String profile(Model model, User user) {
        return "profile";
//        model.addText("User", IUserServiceImpl.findByUserName(user))
    }
}
