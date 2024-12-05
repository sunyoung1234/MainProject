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
        // �ϵ��ڵ��� FAQ ��� ����
        List<FaqDTO> faqList = new ArrayList<>();

        FaqDTO faq1 = new FaqDTO();
        faq1.setFaqId(1);
        faq1.setQuestion("���ο��������๰�̶� �����ΰ���?");
        faq1.setAnswer("���ο��������๰�� ������ ���ϸ� �ּ�ȭ�ϰ� �ſ������� ����������� Ȱ���� ������ �ҿ䷮�� �ּ�ȭ�ϴ� ������๰�� ���մϴ�.");

        FaqDTO faq2 = new FaqDTO();
        faq2.setFaqId(2);
        faq2.setQuestion("���ο��������๰�� �� �߿��Ѱ���?");
        faq2.setAnswer("���๰ �о��� ������ �Һ� �ð� �־� �½ǰ��� ������ ���� �ʼ����̸�, �̷� ������ �ٽ� ���� �������� �ڸ� ��� �ֽ��ϴ�.");

        FaqDTO faq3 = new FaqDTO();
        faq3.setFaqId(3);
        faq3.setQuestion("���ο��������๰�� ������ �Һ� '0'�ΰ���?");
        faq3.setAnswer("������ ���� ���ǰ� �ٸ����� �츮���󿡼��� �ǹ� ������ �Һ񷮰� ����������� ���귮�� ������ ���� Nearly ���ο��������๰�� �����մϴ�.");

        FaqDTO faq4 = new FaqDTO();
        faq4.setFaqId(4);
        faq4.setQuestion("���ο��������๰�� ���� ������ �����ΰ���?");
        faq4.setAnswer("���ο��������๰ ������ ������ ���ɰ� ����������� ������ ���� ���Ͽ� �ο��Ǹ�, ��޺��� ������ ȿ���� �����ϴ�.");

        FaqDTO faq5 = new FaqDTO();
        faq5.setFaqId(5);
        faq5.setQuestion("���ο��������๰�� �ֿ� ����� �����ΰ���?");
        faq5.setAnswer("��ܿ� âȣ, ��ȿ�� �ܿ���, �¾籤 ���� �� ������ ������ ����������� Ȱ���� ���� �پ��� ����� ���˴ϴ�.");

        FaqDTO faq6 = new FaqDTO();
        faq6.setFaqId(6);
        faq6.setQuestion("���ο��������๰ ������ �������� � ������ �ʿ��Ѱ���?");
        faq6.setAnswer("�⺻������ ������ ȿ���� ���� ����� ����������� ���� ��ġ�ؾ� �ϸ�, �� ���ؿ� �´� ������ �޼��ؾ� �մϴ�.");

        FaqDTO faq7 = new FaqDTO();
        faq7.setFaqId(7);
        faq7.setQuestion("���ο��������๰�� ���� ����� ��� �ǳ���?");
        faq7.setAnswer("�ʱ� ��ġ ����� ���� �� ������, ��������� ������ ��� ���� ȿ���� ũ�� ������ ���� ����� ���� ��ϴ�.");

        FaqDTO faq8 = new FaqDTO();
        faq8.setFaqId(8);
        faq8.setQuestion("���ο��������๰�� ���� ���� ������ �ֳ���?");
        faq8.setAnswer("���δ� ���ο��������๰ Ȯ�븦 ���� �μ�Ƽ��� �������� �����ϰ� �ֽ��ϴ�. ���๰�� ������ ȿ�� ��޿� ���� ������ �޶��� �� �ֽ��ϴ�.");

        FaqDTO faq9 = new FaqDTO();
        faq9.setFaqId(9);
        faq9.setQuestion("���ο��������๰�� ���� ���๰�� �������� �����ΰ���?");
        faq9.setAnswer("���ο��������๰�� ������ ����� ����������� ������ ���� ������ �ڱ޷��� ���� ������ ���� ���๰�� ���̰� �ֽ��ϴ�.");

        FaqDTO faq10 = new FaqDTO();
        faq10.setFaqId(10);
        faq10.setQuestion("���ο��������๰�� ������ ��� �ǳ���?");
        faq10.setAnswer("������ ����� ȯ�� ��ȣ�� �����ʿ� ���� ���ο��������๰�� ����� �ʿ伺�� ���������� ������ ������ ����˴ϴ�.");

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

        // FAQ ����Ʈ�� �𵨿� �߰��Ͽ� JSP�� ����
        model.addAttribute("faqList", faqList);
        return "support/faqView";
    }
}
