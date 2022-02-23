
import java.awt.*;
import java.awt.event.*;
import java.sql.*;

import javax.swing.*;


public class InfoUtilizator {
	private static JFrame frame;
	int x;
	int y;
	InfoUtilizator(int x,int y,String nume, String prenume,Connection con){
		this.x=x;
		this.y=y;
		frame=new JFrame("Info "+nume+" "+prenume);
		frame.setSize(300,230);
		frame.setLocation(this.x,this.y);
		frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		
		JTextArea info=new UneditableJTextArea("");
		
		JButton ok=new JButton("OK");
		
		ok.addActionListener(new CloseListener());
		
		try {
			Statement exec=con.createStatement();
		exec.execute("SELECT * FROM utilizator WHERE nume=\""+nume+"\" and prenume=\""+prenume+"\"");
		ResultSet date=exec.getResultSet();
		date.next();
		
		info.append("CNP:"+date.getString("CNP")+"\nadresa:"+date.getString("adresa")+"\nIBAN:"+date.getString("IBAN")+"\ntelefon:"+date.getString("numar_telefon")+
				"\ncontract:"+date.getString("numar_contract")+"\nemail:"+date.getString("email"));
		
		info.setFont(new Font("Seqoe Script",Font.BOLD,12));
		} catch (SQLException e1) {

			e1.printStackTrace();
		}
		
		JPanel p=new JPanel();
		
		JPanel p1=new JPanel();
		p1.add(info);
		JPanel p2=new JPanel();
		p2.add(ok);
		
		p.add(Box.createVerticalStrut(10));
		p.add(p1);
		p1.setAlignmentX(Component.CENTER_ALIGNMENT);
		p.add(p2);
		p2.setAlignmentX(Component.CENTER_ALIGNMENT);
		p.setLayout(new BoxLayout(p,BoxLayout.Y_AXIS));
		
		frame.setContentPane(p);
		frame.setVisible(true);
	}
	
	class CloseListener implements ActionListener{
		public void actionPerformed(ActionEvent e) {
			frame.dispose();
		}
	}
}