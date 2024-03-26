package com.smhrd.model;

import java.util.List;

public class SearchVO {
    private String name;
    private List<String> tags; // 태그를 List<String> 으로 변경

    public SearchVO(String name, List<String> tags) {
        this.name = name;
        this.tags = tags;
    }

    // Getter 및 Setter 수정
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }
}