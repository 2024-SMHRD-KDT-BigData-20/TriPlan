package com.smhrd.model;

import com.smhrd.model.SearchVO;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class SearchDAO {
    private List<SearchVO> places = new ArrayList<>();

    public SearchDAO() {
        
    }

    public List<SearchVO> searchPlaces(String keyword) {
        return places.stream()
                     .filter(place -> place.getName().contains(keyword) || place.getTags().stream().anyMatch(tag -> tag.contains(keyword)))
                     .collect(Collectors.toList());
    }
}