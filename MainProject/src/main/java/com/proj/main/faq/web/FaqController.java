package com.proj.main.faq.web;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.proj.main.faq.dto.FaqDTO;

@Controller
public class FaqController {

    @GetMapping("/faqView")
    public String viewFaq(Model model) {
        // 하드코딩된 FAQ 목록 생성
        List<FaqDTO> faqList = new ArrayList<>();

        FaqDTO faq1 = new FaqDTO();
        faq1.setFaqId(1);
        faq1.setQuestion("제로에너지건축물이란 무엇인가요?");
        faq1.setAnswer("제로에너지건축물은 에너지 부하를 최소화하고 신에너지와 재생에너지를 활용해 에너지 소요량을 최소화하는 녹색건축물을 말합니다.");

        FaqDTO faq2 = new FaqDTO();
        faq2.setFaqId(2);
        faq2.setQuestion("제로에너지건축물이 왜 중요한가요?");
        faq2.setAnswer("건축물 분야의 에너지 소비가 늘고 있어 온실가스 감축을 위해 필수적이며, 미래 건축의 핵심 성장 동력으로 자리 잡고 있습니다.");

        FaqDTO faq3 = new FaqDTO();
        faq3.setFaqId(3);
        faq3.setQuestion("제로에너지건축물은 에너지 소비가 '0'인가요?");
        faq3.setAnswer("국가에 따라 정의가 다르지만 우리나라에서는 건물 에너지 소비량과 신재생에너지 생산량의 비율에 따라 Nearly 제로에너지건축물로 정의합니다.");

        FaqDTO faq4 = new FaqDTO();
        faq4.setFaqId(4);
        faq4.setQuestion("제로에너지건축물의 인증 기준은 무엇인가요?");
        faq4.setAnswer("제로에너지건축물 인증은 에너지 성능과 신재생에너지 발전량 등을 평가하여 부여되며, 등급별로 에너지 효율이 나뉩니다.");

        FaqDTO faq5 = new FaqDTO();
        faq5.setFaqId(5);
        faq5.setQuestion("제로에너지건축물의 주요 기술은 무엇인가요?");
        faq5.setAnswer("고단열 창호, 고효율 단열재, 태양광 발전 등 에너지 절감과 신재생에너지 활용을 위한 다양한 기술이 사용됩니다.");

        FaqDTO faq6 = new FaqDTO();
        faq6.setFaqId(6);
        faq6.setQuestion("제로에너지건축물 인증을 받으려면 어떤 조건이 필요한가요?");
        faq6.setAnswer("기본적으로 에너지 효율을 높인 설비와 신재생에너지 설비를 설치해야 하며, 평가 기준에 맞는 성능을 달성해야 합니다.");

        FaqDTO faq7 = new FaqDTO();
        faq7.setFaqId(7);
        faq7.setQuestion("제로에너지건축물의 유지 비용은 어떻게 되나요?");
        faq7.setAnswer("초기 설치 비용은 높을 수 있지만, 장기적으로 에너지 비용 절감 효과가 크기 때문에 유지 비용이 적게 듭니다.");

        FaqDTO faq8 = new FaqDTO();
        faq8.setFaqId(8);
        faq8.setQuestion("제로에너지건축물의 정부 지원 혜택이 있나요?");
        faq8.setAnswer("정부는 제로에너지건축물 확대를 위해 인센티브와 지원금을 제공하고 있습니다. 건축물의 에너지 효율 등급에 따라 혜택이 달라질 수 있습니다.");

        FaqDTO faq9 = new FaqDTO();
        faq9.setFaqId(9);
        faq9.setQuestion("제로에너지건축물과 기존 건축물의 차이점은 무엇인가요?");
        faq9.setAnswer("제로에너지건축물은 에너지 절약과 신재생에너지 생산을 통해 에너지 자급률을 높인 점에서 기존 건축물과 차이가 있습니다.");

        FaqDTO faq10 = new FaqDTO();
        faq10.setFaqId(10);
        faq10.setQuestion("제로에너지건축물의 전망은 어떻게 되나요?");
        faq10.setAnswer("에너지 절약과 환경 보호가 강조됨에 따라 제로에너지건축물의 수요와 필요성은 지속적으로 증가할 것으로 예상됩니다.");

        faqList.add(faq1);
        faqList.add(faq2);
        faqList.add(faq3);
        faqList.add(faq4);
        faqList.add(faq5);
        faqList.add(faq6);
        faqList.add(faq7);
        faqList.add(faq8);
        faqList.add(faq9);
        faqList.add(faq10);

        // FAQ 리스트를 모델에 추가하여 JSP로 전달
        model.addAttribute("faqList", faqList);
        return "support/faqView";
    }
}
