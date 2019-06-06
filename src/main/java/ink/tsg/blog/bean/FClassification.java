package ink.tsg.blog.bean;

public class FClassification {
    private Integer fclassificationId;

    private String fclassificationName;
    
    

    public Integer getFclassificationId() {
        return fclassificationId;
    }

    public void setFclassificationId(Integer fclassificationId) {
        this.fclassificationId = fclassificationId;
    }

    public String getFclassificationName() {
        return fclassificationName;
    }

    public void setFclassificationName(String fclassificationName) {
        this.fclassificationName = fclassificationName == null ? null : fclassificationName.trim();
    }

	@Override
	public String toString() {
		return "FClassification [fclassificationId=" + fclassificationId + ", fclassificationName="
				+ fclassificationName + "]";
	}

	
}