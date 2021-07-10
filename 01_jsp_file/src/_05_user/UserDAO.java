package _05_user;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
public class UserDAO {
	private UserDAO() {}
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() { return instance; }
	
	private ArrayList<UserDTO> userList = new ArrayList<>();
	
	public String realpath = "";
	String filename = "userdata.txt";
	
	// # 관리자 기능
	// (1) 전체 회원의 정보를 리턴해주는 메서드
	public ArrayList<UserDTO> getUserList() {
		return userList;
	}
	
	// (2) 회원의 id를 전달받아 해당 회원의 모든 정보를 리턴해주는 메서드
	public UserDTO getUserInfo(String id) {
		UserDTO temp = null;
		
		for(int i=0; i<userList.size(); i++) {
			if(userList.get(i).getId().equals(id)) {
				temp = userList.get(i);
			}
		}
		return temp;
	}
	
	public void insertUser(UserDTO user) {
		userList.add(user);
		saveData();
	}
	
	public void updateUser(UserDTO user) {
		System.out.println(user.getId());
		System.out.println(user.getPw());
		System.out.println(user.getName());
	
		for(UserDTO temp : userList) {
			if(temp.getId().equals(user.getId())) {
				temp = user;
				saveData();
				break;
			}
		}	
		
	}
	
	public void deleteUserId(String id) {
		int i = 0;
		for(UserDTO temp : userList) {
			if(temp.getId().equals(id)) {				
				userList.remove(i);
				saveData();
				break;
			}
			i += 1;
		}	
	}
	
	public boolean checkUserId(UserDTO user) {
		for(UserDTO temp : userList) {
			if(temp.getId().equals(user.getId())) {				
				return true;
			}
		}		
		return false;
	}
	
	public boolean checkUserIdPw(String id , String pw) {
		for(UserDTO temp : userList) {
			if(temp.getId().equals(id) && temp.getPw().equals(pw)) {
				return true;
			}
		}	
		return false;
	}
	
	public UserDTO getUserId(String id) {
		for(UserDTO temp : userList) {
			if(temp.getId().equals(id)) {
				return temp;
			}
		}	
		return null;
	}
	
	public void loadData() {		
		File file  = new File(realpath + filename);
		// realpath + /userdata.txt 파일이 존재한다면
		if(file.exists()) {
			// 기존 데이터는 지우고 새로 작성한다.
			userList.clear();	
			try {
				FileReader fr = new FileReader(file);
				BufferedReader br = new BufferedReader(fr);
				String line = br.readLine();
				while(line != null) {					
					String arr[] = line.split("/");
					UserDTO user = new UserDTO();
					user.setId(arr[0]);
					user.setPw(arr[1]);;
					user.setName(arr[2]);;
					user.setReg_date(arr[3]);;
					userList.add(user);
					line = br.readLine();
				}
				fr.close();
				br.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void saveData() {
		String data = "";
		for(UserDTO temp : userList) {
			data += temp.getId();
			data += "/";
			data += temp.getPw();
			data += "/";
			data += temp.getName();
			data += "/";
			data += temp.getReg_date();
			// 윈도우에서는 줄바꿈을 하기 위해 \r\n을 해줘야 한다.
			data += "\r\n";
		}	
		try {
			System.out.println("실제 메모장의 위치 = " + realpath);
			FileWriter fw = new FileWriter(realpath + filename);
			fw.write(data);
			fw.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
