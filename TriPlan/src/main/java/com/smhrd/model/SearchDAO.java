package com.smhrd.model;

import com.smhrd.model.SearchVO;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class SearchDAO {
    private List<SearchVO> places = new ArrayList<>();

    public SearchDAO() {
        // 임시 데이터 생성
    	places.add(new SearchVO("명동", Arrays.asList("쇼핑", "음식")));
        places.add(new SearchVO("남산", Arrays.asList("관광", "등산")));
        // 추가 데이터...
    }

    public List<SearchVO> searchPlaces(String keyword) {
        return places.stream()
                     .filter(place -> place.getName().contains(keyword) || place.getTags().stream().anyMatch(tag -> tag.contains(keyword)))
                     .collect(Collectors.toList());
    }
}