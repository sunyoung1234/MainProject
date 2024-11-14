package com.proj.main.faq.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.proj.main.faq.dao.IFaqDAO;
import com.proj.main.faq.dto.FaqDTO;

@Service
public class FaqService {

    @Autowired
    private IFaqDAO faqDAO;

    public List<FaqDTO> getAllFaqs() {
        return faqDAO.getAllFaqs();
    }
}
