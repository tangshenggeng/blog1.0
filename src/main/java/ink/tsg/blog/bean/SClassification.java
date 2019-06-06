package ink.tsg.blog.bean;

public class SClassification {
    private Integer sclassificationId;

    private String sclassificationName;

    private Integer scFcId;

    public Integer getSclassificationId() {
        return sclassificationId;
    }

    public void setSclassificationId(Integer sclassificationId) {
        this.sclassificationId = sclassificationId;
    }

    public String getSclassificationName() {
        return sclassificationName;
    }

    public void setSclassificationName(String sclassificationName) {
        this.sclassificationName = sclassificationName == null ? null : sclassificationName.trim();
    }

    public Integer getScFcId() {
        return scFcId;
    }

    public void setScFcId(Integer scFcId) {
        this.scFcId = scFcId;
    }

	@Override
	public String toString() {
		return "SClassification [sclassificationId=" + sclassificationId + ", sclassificationName="
				+ sclassificationName + ", scFcId=" + scFcId + "]";
	}
}