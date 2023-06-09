package com.kbstar.service;


import com.kbstar.dto.Item;
import com.kbstar.dto.ItemSearch;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.ItemMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class ItemService implements KBService<Integer, Item> {

    @Autowired
    ItemMapper mapper;

    public ItemService(ItemMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public void register(Item item) throws Exception {
        mapper.insert(item);
    }

    @Override
    public void remove(Integer k) throws Exception {
        mapper.delete(k);

    }

    @Override
    public void modify(Item item) throws Exception {
        mapper.update(item);
    }

    @Override
    public Item get(Integer k) throws Exception {
        return mapper.select(k);
    }

    @Override
    public List<Item> get() throws Exception {
        return mapper.selectall();
    }

    public List<Item> search(ItemSearch ms) throws Exception{
        return mapper.search(ms);
    }

}
