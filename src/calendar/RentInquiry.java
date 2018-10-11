package calendar;

//조회를 하기위한 객체 생성
public class RentInquiry {
	private int rentId;
	private int userId;
	private String name;
	private int roomId;
	private String roomName;
	private String rentDate;
	private String rentTime;
	
	public RentInquiry(int rentId, int userId, String name, int roomId, String roomName, String rentDate, String rentTime) {
		this.rentId = rentId;
		this.userId = userId;
		this.name = name;
		this.roomId = roomId;
		this.roomName = roomName;
		this.rentDate = rentDate;
		this.rentTime = rentTime;
	}
	public int getRentId() {
		return rentId;
	}
	public void setRentId(int rentId) {
		this.rentId = rentId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getRentDate() {
		return rentDate;
	}
	public void setRentDate(String rentDate) {
		this.rentDate = rentDate;
	}
	public String getRentTime() {
		return rentTime;
	}
	public void setRentTime(String rentTime) {
		this.rentTime = rentTime;
	}
	
}
