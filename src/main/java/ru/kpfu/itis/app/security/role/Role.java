package ru.kpfu.itis.app.security.role;

public enum Role {
    ADMIN("ADMIN"), USER("USER"), MANAGER("MANAGER"), CLIENT("CLIENT"), STRINGER("STRINGER"), COACH("COACH");

    private String text;

    Role(String text) {
        this.text = text;
    }

    public String getText() {
        return this.text;
    }

    public static Role fromString(String text) {
        for (Role b : Role.values()) {
            if (b.text.equalsIgnoreCase(text)) {
                return b;
            }
        }
        return null;
    }}