package icsd;

public class ClsFront {
	String strname=null,stroccupation=null,straddress=null,strimg=null;

	public String getStrname() {
		return strname;
	}

	public void setStrname(String strname) {
		this.strname = strname;
	}


	public ClsFront(String strname, String stroccupation, String straddress, String strimg) {
		super();
		this.strname = strname;
		this.stroccupation = stroccupation;
		this.straddress = straddress;
		this.strimg = strimg;
	}

	@Override
	public String toString() {
		return "ClsFront [strname=" + strname + ", stroccupation=" + stroccupation + ", straddress=" + straddress
				+ ", strimg=" + strimg + "]";
	}

	public String getStroccupation() {
		return stroccupation;
	}

	public void setStroccupation(String stroccupation) {
		this.stroccupation = stroccupation;
	}

	public String getStraddress() {
		return straddress;
	}

	public void setStraddress(String straddress) {
		this.straddress = straddress;
	}

	public String getStrimg() {
		return strimg;
	}

	public void setStrimg(String strimg) {
		this.strimg = strimg;
	}

}
