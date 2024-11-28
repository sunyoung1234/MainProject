package com.proj.main.board.vo;

public class SearchVO {
    
    // �˻� ����
    private String searchOption; // �˻� �ɼ� (��: ����: title, �ۼ���: writer)
    private String searchWord;   // �˻� Ű����

    // ����¡ ���� ����
    private int pageNo = 1;           // ���� ������ ��ȣ
    private int rowSizePerPage = 10;  // �� �������� ������ �Խñ� ��
    private int pageSize = 5;         // ������ �׺���̼��� ������ ��
    private int boardCount;           // �� �Խñ� ��

    // ����¡ ���� ����
    private int start;        // �������� ǥ���� ù �Խñ� ��ȣ
    private int end;          // �������� ǥ���� ������ �Խñ� ��ȣ
    private int firstPage;    // ������ �׺���̼��� ù ��° ������ ��ȣ
    private int lastPage;     // ������ �׺���̼��� ������ ������ ��ȣ
    private int finalPage;    // ��ü ������ ������ ��ȣ

    // ����¡ ��� �޼ҵ�
    public void pageSetting() {
        this.start = (pageNo - 1) * rowSizePerPage + 1;
        this.end = pageNo * rowSizePerPage;

        // ��ü ������ �� ���
        finalPage = (int) Math.ceil((double) boardCount / rowSizePerPage);

        // �׺���̼��� ù ��° ������ ��ȣ ���
        firstPage = ((pageNo - 1) / pageSize) * pageSize + 1;
        lastPage = firstPage + pageSize - 1;

        // ������ ������ ��ȣ�� ���� ������ ���������� ũ�� ����
        if (lastPage > finalPage) {
            lastPage = finalPage;
        }
    }

    // �⺻ ������
    public SearchVO() {
    }

    // Getter & Setter
    public String getSearchOption() {
        return searchOption;
    }

    public void setSearchOption(String searchOption) {
        this.searchOption = searchOption;
    }

    public String getSearchWord() {
        return searchWord;
    }

    public void setSearchWord(String searchWord) {
        this.searchWord = searchWord;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getRowSizePerPage() {
        return rowSizePerPage;
    }

    public void setRowSizePerPage(int rowSizePerPage) {
        this.rowSizePerPage = rowSizePerPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getBoardCount() {
        return boardCount;
    }

    public void setBoardCount(int boardCount) {
        this.boardCount = boardCount;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public int getFirstPage() {
        return firstPage;
    }

    public void setFirstPage(int firstPage) {
        this.firstPage = firstPage;
    }

    public int getLastPage() {
        return lastPage;
    }

    public void setLastPage(int lastPage) {
        this.lastPage = lastPage;
    }

    public int getFinalPage() {
        return finalPage;
    }

    public void setFinalPage(int finalPage) {
        this.finalPage = finalPage;
    }

    @Override
    public String toString() {
        return "SearchVO [searchOption=" + searchOption + ", searchWord=" + searchWord + 
               ", pageNo=" + pageNo + ", rowSizePerPage=" + rowSizePerPage + 
               ", pageSize=" + pageSize + ", boardCount=" + boardCount +
               ", start=" + start + ", end=" + end + 
               ", firstPage=" + firstPage + ", lastPage=" + lastPage + 
               ", finalPage=" + finalPage + "]";
    }
}
