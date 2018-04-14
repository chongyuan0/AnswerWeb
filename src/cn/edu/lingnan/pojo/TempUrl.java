package cn.edu.lingnan.pojo;

public class TempUrl {
    private Integer tempurlid;

    private String fileurl;

    private String newdate;

    public Integer getTempurlid() {
        return tempurlid;
    }

    public void setTempurlid(Integer tempurlid) {
        this.tempurlid = tempurlid;
    }

    public String getFileurl() {
        return fileurl;
    }

    public void setFileurl(String fileurl) {
        this.fileurl = fileurl == null ? null : fileurl.trim();
    }

    public String getNewdate() {
        return newdate;
    }

    public void setNewdate(String newdate) {
        this.newdate = newdate == null ? null : newdate.trim();
    }
}