package com.imooc.bean;

import java.util.List;

/**
 * Created by xuhf on 2017/11/15.
 */
public class Command {

    private int id;

    private String command;

    private String description;

    private List<CommandContent> contents;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCommand() {
        return command;
    }

    public void setCommand(String command) {
        this.command = command;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<CommandContent> getContents() {
        return contents;
    }

    public void setContents(List<CommandContent> contents) {
        this.contents = contents;
    }
}
