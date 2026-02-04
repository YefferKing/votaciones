package com.cavm.voto.electronico.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class KeepAliveController {
    
    @GetMapping("/public/alive")
    public String keepAlive() {
        return "Servidor activo";
    }
}
