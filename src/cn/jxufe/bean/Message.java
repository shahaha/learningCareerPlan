package cn.jxufe.bean;

import java.io.Serializable;

public class Message implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 2179543659385733402L;
	private int code;
    private String msg;
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
    
}