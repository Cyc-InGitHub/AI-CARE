package com.aicare.common.utils;

import java.io.Serializable;
import java.util.List;

/**
 * @Author bootdo 1992lcg@163.com
 */
public class PageUtils2 implements Serializable {
	private static final long serialVersionUID = 1L;
	private int count;
	private List<?> data;
	private String code;
	private String msg;

	public PageUtils2(List<?> data, int count) {
		this.data = data;
		this.count = count;
		this.code = "0";
		this.msg = "success";
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public List<?> getData() {
		return data;
	}

	public void setData(List<?> data) {
		this.data = data;
	}
}
