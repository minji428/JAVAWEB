package com.green.board;

import java.util.Date;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class BoardDAO {
	private BoardDAO() {}
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {return instance;}
	
	private static int idNum;	// 게시글 고유 번호
	private ArrayList<BoardDTO> boardList = new ArrayList<BoardDTO>();
	
	public String realPath;
	public String fileName = "board.text";
	
	// (1) 새 게시글을 저장해주는 메서드
public void boardWrite(BoardDTO board) {
		
		/* 아래 5개의 항목은 입력받을 수 없는 데이터로서
		 * 직접 값을 저장해줘야 한다.
		 * 
		 * ① 게시글 번호	: 마지막 게시글 번호에 1을 증가시킨다.
		 * ② 작성일		: Date클래스를 활용해 작성일자를 저장한다.
		 * ③ ref		: 새글의 ref는 현재 최대 ref값에 1을 증가시킨다.
		 * ④ reStep		: 새글의 reStep의 값은 1이다.
		 * ⑤ reLevel	: 새글의 reLevel의 값은 1이다.
		 */
		
		int num = BoardDAO.idNum + 1;
		String regDate = getDate();
		int ref = getMaxOfRef() + 1;
		int reStep = 1;
		int reLevel = 1;
		
		board.setNum(num);
		board.setRegDate(regDate);
		board.setRef(ref);
		board.setReStep(reStep);
		board.setReLevel(reLevel);
		
		BoardDAO.idNum++;
		boardList.add(board);
		
		fileSave();
		
		printBoardList();
	}

	// (2) 전체 게시글 수를 리턴해주는 메서드
	public int getAllCount() {
		return boardList.size();
	}
	
	// (3) 오늘 날짜를 문자열로 리턴해주는 메서드
	public String getDate() {
		Date date = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
	
	// (4) 최대 ref값을 리턴해주는 메서드
	public int getMaxOfRef() {
		int maxRef = 0;
		if(boardList.size()!=0) {
			int lastIndex = boardList.size()-1;
			maxRef = boardList.get(lastIndex).getRef();
		}
		return maxRef;
	}
	
	// (5) 전체 게시글 내용을 출력해주는 메서드 <-- 콘솔 검토용
	public void printBoardList() {
		for(BoardDTO board : boardList) {
			System.out.println(board.toString());
		}
		System.out.println("\n\n\n");
	}
	
	// (6) boardList를 리턴해주는 메서드
	public ArrayList<BoardDTO> getBoardList(){
		return boardList;
	}
	
	// (7) 게시글 번호를 넘겨받으면 해당 게시글의 인덱스를 리턴해주는 메서드
	public int getBoardIndex(int num) {
		int index = 0;
		for(int i=0; i<boardList.size(); i++) {
			if(boardList.get(i).getNum() == num) {
				index = i;
			}
		}
		return index;
	}
	
	// (7) 게시글 번호를 넘겨받아 해당 게시글 정보를 리턴해주는 메서드(게시글 내용 확인하기)
	public BoardDTO getBoardOfInfo(int num) {
		int index = getBoardIndex(num);
		
		BoardDTO board = boardList.get(index);
		// 게시글을 선택했기 때문에 조회수를 1 증가 시킨다
		board.setReadCount(board.getReadCount()+1);
		
		fileSave();
		
		return board;
	}
	
	// (8) 게시글 번호를 넘겨받아 해당 게시글 정보를 리턴해주는 메서드(게시글 내용 수정하기)
	public BoardDTO getBoardOfUpdate(int num) {
		int index = getBoardIndex(num);
		
		return boardList.get(index);
	}
	
	// (9) 게시글의 내용을(이메일, 제목, 내용) 수정해주는 메서드
	public void boardUpdate(BoardDTO board) {
		int index = getBoardIndex(board.getNum());
		
		boardList.get(index).setEmail(board.getContent());
		boardList.get(index).setSubject(board.getSubject());
		boardList.get(index).setContent(board.getContent());
		
		fileSave();
	}
	
	// (10) 게시글 삭제해주는 메서드 : 비밀번호가 일치하면 1을 불일치하면 -1을 리턴해준다.
	public int boardDelete(int num, String password) {
		int result = -1;
		
		int index = getBoardIndex(num);
		
		String dbPassword = boardList.get(index).getPassword();
		
		if(dbPassword.equals(password)) {
			result = 1;
			
			boardList.remove(index);
		}
		
		fileSave();
		
		return result;
	}
	
	// (11) 현재 데이터를 한개의 문자열로 연결해주는 메서드
		public String getFileData() {
			// 게시글의 마지막 번호
			// num/writer/email/password/subject/content/regDate/readCount/ref/reStep/reLevel
			String data = idNum + "\n";
			for(int i=0; i<boardList.size(); i++) {
				data += boardList.get(i).getNum() + "/";
				data += boardList.get(i).getWriter() + "/";
				data += boardList.get(i).getEmail() + "/";
				data += boardList.get(i).getPassword() + "/";
				data += boardList.get(i).getSubject() + "/";
				data += boardList.get(i).getContent() + "/";
				data += boardList.get(i).getRegDate() + "/";
				data += boardList.get(i).getReadCount() + "/";
				data += boardList.get(i).getRef() + "/";
				data += boardList.get(i).getReStep() + "/";
				data += boardList.get(i).getReLevel();
				
				if(i != boardList.size()-1) {
					data += "\n";
				}
			}
			System.out.println(data);
			
			return data;
		}
		
		// (12) 파일 저장
		public void fileSave() {
			String data = getFileData();
			
			FileWriter fw = null;
			try {
				fw = new FileWriter(realPath + fileName);
				fw.write(data);
				System.out.println("[메세지]파일이 저장되었습니다.");
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(fw != null) {try {fw.close();} catch (IOException e) {}}
			}
			
			fileLoad();
			System.out.println(realPath);
		}
		
		// (13) 파일 로드
		public void fileLoad() {
			File file = new File(realPath + fileName);
			System.out.println("파일의 실제 위치 = " + realPath);
			// file.exists() : 파일이 존재하면 true를 리턴해준다.
			if(file.exists()) {
				boardList.clear();
				
				FileReader fr = null;
				BufferedReader br = null;
				
				try {
					fr = new FileReader(file);
					br = new BufferedReader(fr);
					
					BoardDAO.idNum = Integer.parseInt(br.readLine());
					
					while(true) {
						String line = br.readLine();
						if(line == null) break;
						
						String[] info = line.split("/");
						
						BoardDTO board = new BoardDTO();
						board.setNum(Integer.parseInt(info[0]));
						board.setWriter(info[1]);
						board.setEmail(info[2]);
						board.setPassword(info[3]);
						board.setSubject(info[4]);
						board.setContent(info[5]);
						board.setRegDate(info[6]);
						board.setReadCount(Integer.parseInt(info[7]));
						board.setRef(Integer.parseInt(info[8]));
						board.setReStep(Integer.parseInt(info[9]));
						board.setReLevel(Integer.parseInt(info[10]));
						
						boardList.add(board);
					}
					
					if(boardList.size() <= 0) {
						return;
					}
					
					System.out.println("[메세지]파일이 로드되었습니다.");
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					if(fr != null) {try {fr.close();} catch (IOException e) {}}
					if(br != null) {try {br.close();} catch (IOException e) {}}
				}
			}
		}

		// (14) 더미 파일 셋팅
		public void setDummyData() {
			for(int i=0; i<10; i++) {
				int index = BoardDAO.idNum + 1;

				BoardDTO board = new BoardDTO();
				board.setWriter("작성자" + index);
				board.setSubject("제목" + index);
				board.setEmail("email" + index + "@naver.com");
				board.setPassword("1111");
				board.setContent("내용" + index);
				
				boardWrite(board);
			}
		}
		
		// (15) 전체 게시글을 삭제해주는 메서드
		public void boardClear() {
			boardList.clear();
			
			fileSave();
			
			BoardDAO.idNum = 0;
		}
}
