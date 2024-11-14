package com.proj.main.faq.dao;

import com.proj.main.faq.dto.FaqDTO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface IFaqDAO {
    List<FaqDTO> getAllFaqs();
}
