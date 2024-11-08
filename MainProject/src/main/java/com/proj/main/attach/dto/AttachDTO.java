package com.proj.main.attach.dto;

public class AttachDTO {
		private int atchNo;
		private String atchFileName;
		private String atchOriginalName;
		private long atchFileSize;
		private String atchFancySize;
		private String atchContentType;
		private String atchPath;
		
		public AttachDTO() {
			super();
		}

		public AttachDTO(int atchNo, String atchFileName, String atchOriginalName, long atchFileSize,
				String atchFancySize, String atchContentType, String atchPath) {
			super();
			this.atchNo = atchNo;
			this.atchFileName = atchFileName;
			this.atchOriginalName = atchOriginalName;
			this.atchFileSize = atchFileSize;
			this.atchFancySize = atchFancySize;
			this.atchContentType = atchContentType;
			this.atchPath = atchPath;
		}

		@Override
		public String toString() {
			return "AttachDTO [atchNo=" + atchNo + ", atchFileName=" + atchFileName + ", atchOriginalName="
					+ atchOriginalName + ", atchFileSize=" + atchFileSize + ", atchFancySize=" + atchFancySize
					+ ", atchContentType=" + atchContentType + ", atchPath=" + atchPath + "]";
		}

		public int getAtchNo() {
			return atchNo;
		}

		public void setAtchNo(int atchNo) {
			this.atchNo = atchNo;
		}

		public String getAtchFileName() {
			return atchFileName;
		}

		public void setAtchFileName(String atchFileName) {
			this.atchFileName = atchFileName;
		}

		public String getAtchOriginalName() {
			return atchOriginalName;
		}

		public void setAtchOriginalName(String atchOriginalName) {
			this.atchOriginalName = atchOriginalName;
		}

		public long getAtchFileSize() {
			return atchFileSize;
		}

		public void setAtchFileSize(long atchFileSize) {
			this.atchFileSize = atchFileSize;
		}

		public String getAtchFancySize() {
			return atchFancySize;
		}

		public void setAtchFancySize(String atchFancySize) {
			this.atchFancySize = atchFancySize;
		}

		public String getAtchContentType() {
			return atchContentType;
		}

		public void setAtchContentType(String atchContentType) {
			this.atchContentType = atchContentType;
		}

		public String getAtchPath() {
			return atchPath;
		}

		public void setAtchPath(String atchPath) {
			this.atchPath = atchPath;
		}

		
		
	
		
}
