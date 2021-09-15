package com.dao;

import com.model.*;

import java.sql.*;
import java.util.ArrayList;

public class SchoolDao extends Basedao {

    //管理员和教师登录
    public Teacher loginTeacher(String school_id){
        String sql = "SELECT * FROM huangym_Teachers15 WHERE hym_Tno15=?";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,school_id);
            Teacher teacher = new Teacher();
            try(ResultSet rst = pstmt.executeQuery()){
                if(rst.next()){
                    teacher.setTno(rst.getString("hym_Tno15"));
                    teacher.setTpass(rst.getString("hym_Tpwd15"));
                    teacher.setRole(rst.getInt("hym_Tauthority15"));
                }
            }
            return teacher;
        }catch (SQLException se){
            se.printStackTrace();
            return null;
        }
    }

    //学生登录
    public Student loginStudent(String school_id){
        String sql = "SELECT * FROM huangym_Students15 WHERE hym_Sno15=?";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,school_id);
            Student student = new Student();
            try(ResultSet rst = pstmt.executeQuery()){
                if(rst.next()){
                    student.setSno(rst.getString("hym_Sno15"));
                    student.setSpwd(rst.getString("hym_Spwd15"));
                }
            }
            return student;
        }catch (SQLException se){
            se.printStackTrace();
            return null;
        }
    }

    //学生总数
    public int studentSum(){
        String sql = "SELECT * FROM huangym_Students15";
        int sum = 0;
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            try(ResultSet rst = pstmt.executeQuery()){
                while(rst.next()){
                    sum++;
                }
            }
            return sum;
        }catch (SQLException se){
            se.printStackTrace();
            return 0;
        }
    }

    //教师总数
    public int TeacherSum(){
        String sql = "SELECT * FROM huangym_Teachers15";
        int sum = 0;
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            try(ResultSet rst = pstmt.executeQuery()){
                while(rst.next()){
                    sum++;
                }
            }
            return sum;
        }catch (SQLException se){
            se.printStackTrace();
            return 0;
        }
    }

    //查询所有学生信息
    public ArrayList<Student> QueryAllStudent(){
        String sql = "SELECT * FROM huangym_Students15";
        ArrayList<Student>stuList = new ArrayList<Student>();
        try(Connection conn = dataSource.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)){
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    Student student = new Student();
                    student.setSno(rst.getString("hym_Sno15"));
                    student.setSname(rst.getString("hym_Sname15"));
                    student.setClassno(rst.getString("hym_Classno15"));
                    student.setSsex(rst.getString("hym_Ssex15"));
                    student.setSage(rst.getInt("hym_Sage15"));
                    student.setScredit(rst.getString("hym_Scredit15"));
                    student.setShometown(rst.getString("hym_Shometown15"));
                    student.setSpwd(rst.getString("hym_Spwd15"));
                    student.setSphone(rst.getString("hym_Sphone15"));
                    stuList.add(student);
                }
            }
            return stuList;
        }catch (SQLException se ){
            se.printStackTrace();
            return null;
        }
    }

    //查询所有教师信息
    public ArrayList<Teacher> QueryAllTeacher(){
        String sql = "SELECT * FROM huangym_Teachers15";
        ArrayList<Teacher>teaList = new ArrayList<Teacher>();
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    Teacher teacher = new Teacher();
                    teacher.setTno(rst.getString("hym_Tno15"));
                    teacher.setTname(rst.getString("hym_Tname15"));
                    teacher.setTsex(rst.getString("hym_Tsex15"));
                    teacher.setTage(rst.getInt("hym_Tage15"));
                    teacher.setTprofess(rst.getString("hym_Tprofess15"));
                    teacher.setTphone(rst.getString("hym_Tphone15"));
                    teacher.setTpass(rst.getString("hym_Tpwd15"));
                    teaList.add(teacher);
                }
            }
            return teaList;
        }catch (SQLException se ){
            se.printStackTrace();
            return null;
        }
    }

    //查询所有课程
    public ArrayList<Course> QueryAllCourse(){
        String sql = "SELECT * FROM huangym_Courses15";
        ArrayList<Course>courseList = new ArrayList<Course>();
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    Course course = new Course();
                    course.setCourseno(rst.getString("hym_Courseno15"));
                    course.setCoursename(rst.getString("hym_Coursename15"));
                    course.setCterm(rst.getString("hym_Cterm15"));
                    course.setChour(rst.getInt("hym_Chours15"));
                    course.setCassessment(rst.getString("hym_Cassessment15"));
                    course.setCcredit(rst.getString("hym_Ccredit15"));
                    courseList.add(course);
                }
            }
            return courseList;
        }catch (SQLException se ){
            se.printStackTrace();
            return null;
        }
    }

    //按学号查询学生信息
    public ArrayList<Student> QueryStudent(String school_id){
        String sql = "SELECT * FROM huangym_Students15 WHERE hym_Sno15=?";
        ArrayList<Student> stuList = new ArrayList<Student>();
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,school_id);
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    Student student = new Student();
                    student.setSno(rst.getString("hym_Sno15"));
                    student.setSname(rst.getString("hym_Sname15"));
                    student.setClassno(rst.getString("hym_Classno15"));
                    student.setSsex(rst.getString("hym_Ssex03"));
                    student.setSage(rst.getInt("hym_Sage03"));
                    student.setScredit(rst.getString("hym_Scredit15"));
                    student.setShometown(rst.getString("hym_Shometown15"));
                    student.setSpwd(rst.getString("hym_spwd15"));
                    stuList.add(student);
                }
            }
            return stuList;
        }catch (SQLException se ){
            se.printStackTrace();
            return null;
        }
    }

    //按学号查询学生成绩
    public ArrayList<Student> QueryStudentGpa(String school_id){
        String sql = "SELECT * FROM huangym_Students15 WHERE hym_Sno15=?";
        ArrayList<Student> stuList = new ArrayList<Student>();
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,school_id);
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    Student student = new Student();
                    student.setSavggpa(rst.getString("hym_Savggpa15"));
                    student.setScredit(rst.getString("hym_Scredit15"));
                    stuList.add(student);
                }
            }
            return stuList;
        }catch (SQLException se ){
            se.printStackTrace();
            return null;
        }
    }

    //按工号查询老师信息
    public ArrayList<Teacher> QueryTeacher(String school_id){
        String sql = "SELECT * FROM huangym_Teachers15 WHERE hym_Tno15=?";
        ArrayList<Teacher> teaList = new ArrayList<Teacher>();
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,school_id);
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    Teacher teacher = new Teacher();
                    teacher.setTno(rst.getString("hym_Tno15"));
                    teacher.setTname(rst.getString("hym_Tname15"));
                    teacher.setTsex(rst.getString("hym_Tsex15"));
                    teacher.setTage(rst.getInt("hym_Tage15"));
                    teacher.setTprofess(rst.getString("hym_Tprofess15"));
                    teacher.setTphone(rst.getString("hym_Tphone15"));
                    teacher.setTpass(rst.getString("hym_Tpwd15"));
                    teaList.add(teacher);
                }
            }
            return teaList;
        }catch (SQLException se ){
            se.printStackTrace();
            return null;
        }
    }

    //查询教师单个
    public Teacher QueryTeacher1(String school_id){
        String sql = "SELECT * FROM huangym_Teachers15 WHERE hym_Tno15=?";
        Teacher teacher = new Teacher();
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,school_id);
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    teacher.setTno(rst.getString("hym_Tno15"));
                    teacher.setTname(rst.getString("hym_Tname15"));
                    teacher.setTsex(rst.getString("hym_Tsex15"));
                    teacher.setTage(rst.getInt("hym_Tage15"));
                    teacher.setTprofess(rst.getString("hym_Tprofess15"));
                    teacher.setTphone(rst.getString("hym_Tphone15"));
                    teacher.setTpass(rst.getString("hym_Tpwd15"));
                }
            }
            return teacher;
        }catch (SQLException se ){
            se.printStackTrace();
            return null;
        }
    }

    //查询学生单个
    public Student QueryStudent1(String school_id){
        String sql = "SELECT * FROM huangym_Students15 WHERE hym_Sno15=?";
        Student student = new Student();
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,school_id);
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    student.setSno(rst.getString("hym_Sno15"));
                    student.setSname(rst.getString("hym_Sname15"));
                    student.setClassno(rst.getString("hym_Classno15"));
                    student.setSsex(rst.getString("hym_Ssex15"));
                }
            }
            return student;
        }catch (SQLException se ){
            se.printStackTrace();
            return null;
        }
    }

    //按课程编号查询课程信息
    public ArrayList<Course> QueryCourse(String school_id){
        String sql = "SELECT * FROM huangym_Courses15 WHERE hym_Courseno15=?";
        ArrayList<Course>courseList = new ArrayList<Course>();
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,school_id);
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    Course course = new Course();
                    course.setCourseno(rst.getString("hym_Courseno15"));
                    course.setCoursename(rst.getString("hym_Coursename15"));
                    course.setCterm(rst.getString("hym_Cterm15"));
                    course.setChour(rst.getInt("hym_Chours15"));
                    course.setCassessment(rst.getString("hym_Cassesment15"));
                    course.setCcredit(rst.getString("hym_Ccredit15"));
                    courseList.add(course);
                }
            }
            return courseList;
        }catch (SQLException se ){
            se.printStackTrace();
            return null;
        }
    }

    //添加学生信息
    public boolean addStudent(String sno, String mno, String sname, String sex, int sage, int avggpa, String spoint, String sphone ,String shome, String spwd, String bno){
        String sql = "INSERT INTO huangym_Students15 VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        try(Connection conn = dataSource.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,sno);
            pstmt.setString(2,mno);
            pstmt.setString(3,sname);
            pstmt.setString(4,sex);
            pstmt.setInt(5,sage);
            pstmt.setInt(6,avggpa);
            pstmt.setInt(7,Integer.parseInt(spoint));
            pstmt.setString(8,sphone);
            pstmt.setString(9,shome);
            pstmt.setString(10,spwd);
            pstmt.setString(11,bno);
            pstmt.executeUpdate();
        }catch (SQLException se){
            se.printStackTrace();
            return false;
        }
        return true;
    }

    //添加教师信息
    public boolean addTeacher(String tno, String tname, String tsex, int tage, String tprofess, String tphone, String tpass, int role, String Collegeno){
        String sql = "INSERT INTO huangym_Teachers15 VALUES(?,?,?,?,?,?,?,?,?)";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,tno);
            pstmt.setString(2,tname);
            pstmt.setString(3,tsex);
            pstmt.setString(4,tprofess);
            pstmt.setString(5,tphone);
            pstmt.setInt(6,role);
            pstmt.setString(7,tpass);
            pstmt.setInt(8,tage);
            pstmt.setString(9,Collegeno);

            pstmt.executeUpdate();
        }catch (SQLException se){
            se.printStackTrace();
            return false;
        }
        return true;
    }

    //添加课程信息
    public boolean addCourse(String cno, String cname, String cterm, int ctime, String cway, String ccredit, String collegeno, String tno){
        String sql = "INSERT INTO huangym_Courses15 VALUES(?,?,?,?,?,?,?,?)";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,cno);
            pstmt.setString(2,cname);
            pstmt.setString(6,cterm);
            pstmt.setInt(5,ctime);
            pstmt.setString(7,cway);
            pstmt.setString(4,ccredit);
            pstmt.setString(3,collegeno);
            pstmt.setString(8,tno);
            pstmt.executeUpdate();
        }catch (SQLException se){
            se.printStackTrace();
            return false;
        }
        return true;
    }

    //删除学生信息
    public boolean delStudent(String school_id){
    String sql = "DELETE FROM huangym_Students15 WHERE hym_Sno15=?";
    try(Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)){
        pstmt.setString(1,school_id);
        pstmt.executeUpdate();
        return true;
    }catch (SQLException se){
        se.printStackTrace();
        return false;
    }
    }

    //删除教师信息
    public boolean delTeacher(String school_id){
        String sql = "DELETE FROM huangym_Teachers15 WHERE hym_Tno15=?";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,school_id);
            pstmt.executeUpdate();
            return true;
        }catch (SQLException se){
            se.printStackTrace();
            return false;
        }
    }

    //删除课程信息
    public boolean delCourse(String school_id){
        String sql = "DELETE FROM huangym_Courses15 WHERE hym_Courseno15=?";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,school_id);
            pstmt.executeUpdate();
            return true;
        }catch (SQLException se){
            se.printStackTrace();
            return false;
        }
    }

    //修改学生信息（学号）
    public boolean modStudent1(String sno, String bno, String sname, String sex, int sage, String shome, String spoint , String spwd ,String snoold){
        String sql = "UPDATE huangym_Students15 SET hym_Sno15=?,hym_Classno15=?,hym_Sname15=?,hym_Ssex15=?,hym_Sage15=?,hym_Shometown15=?,hym_Scredit15=?,hym_spwd15=? WHERE hym_Sno15=?";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,sno);
            pstmt.setString(2,bno);
            pstmt.setString(3,sname);
            pstmt.setString(4,sex);
            pstmt.setInt(5,sage);
            pstmt.setString(6,shome);
            pstmt.setInt(7,Integer.parseInt(spoint));
            pstmt.setString(8,spwd);
            pstmt.setString(9,snoold);
            pstmt.executeUpdate();
        }catch (SQLException se){
            se.printStackTrace();
            return false;
        }
        return true;
    }

    //修改教师信息
    public boolean modTeacher(String tno, String tname, String tsex, int tage, String tprofess, String tphone, String tpass,String tnoold){
        String sql = "UPDATE huangym_Teachers15 SET hym_Tno15=?,hym_Tname15=?,hym_Tsex15=?,hym_Tage15=?,hym_Tprofess15=?,hym_Tphone15=?,hym_Tpwd15=? WHERE hym_Tno15=?";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,tno);
            pstmt.setString(2,tname);
            pstmt.setString(3,tsex);
            pstmt.setInt(4,tage);
            pstmt.setString(5,tprofess);
            pstmt.setString(6,tphone);
            pstmt.setString(7,tpass);
            pstmt.setString(8,tnoold);
            pstmt.executeUpdate();
        }catch (SQLException se){
            se.printStackTrace();
            return false;
        }
        return true;
    }

    //修改管理员密码
    public boolean modAdminPass(String pass ,String ano){
        String sql = "UPDATE huangym_Teachers15 SET hym_Tpwd15=? WHERE hym_Tno15=?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,pass);
            pstmt.setString(2,ano);
            pstmt.executeUpdate();
        }catch (SQLException se){
            se.printStackTrace();
            return false;
        }
        return true;
    }

    //修改学生密码
    public boolean modStudentPass(String pass ,String sno){
        String sql = "UPDATE huangym_Students15 SET hym_spwd15=? WHERE hym_Sno15=?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,pass);
            pstmt.setString(2,sno);
            pstmt.executeUpdate();
        }catch (SQLException se){
            se.printStackTrace();
            return false;
        }
        return true;
    }

    //修改课程信息
    public boolean modCourse(String cno, String cname, String cterm, int ctime, String cway, String ccredit,String cnoold){
        String sql = "UPDATE huangym_Courses15 SET hym_Courseno15=?,hym_Coursename15=?,hym_Cterm15=?,hym_Chours15=?,hym_Cassessment15=?,hym_Ccredit15=? WHERE hym_Courseno15=?";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,cno);
            pstmt.setString(2,cname);
            pstmt.setString(3,cterm);
            pstmt.setInt(4,ctime);
            pstmt.setString(5,cway);
            pstmt.setInt(6,Integer.parseInt(ccredit));
            pstmt.setString(7,cnoold);
            pstmt.executeUpdate();
        }catch (SQLException se){
            se.printStackTrace();
            return false;
        }
        return true;
    }

    //生源地统计
    public ArrayList<Shome> countStudentHome(){
        String sql = "SELECT hym_Shometown15,COUNT(hym_Shometown15) stunum from huangym_Students15 group by hym_Shometown15";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            ArrayList<Shome> shome = new ArrayList<Shome>();
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    Shome shome1 = new Shome();
                    shome1.setShometown(rst.getString("hym_Shometown15"));
                    shome1.setCount(rst.getInt("stunum"));
                    shome.add(shome1);
                }

            }
            return shome;
        }catch (SQLException se){
            se.printStackTrace();
            return null;
        }

    }

    //班级课表查询
    public ArrayList<BanjiCourse> queryBanjiCourse(String bno){
        String sql = "SELECT * FROM hym_ClassCourse_View WHERE hym_classno15=?";
        ArrayList<BanjiCourse>banjiCoursesList = new ArrayList<BanjiCourse>();
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,bno);
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    BanjiCourse banjiCourse = new BanjiCourse();
                    banjiCourse.setCourseno(rst.getString("hym_Courseno15"));
                    banjiCourse.setCoursename(rst.getString("hym_Coursename15"));
                    banjiCourse.setClassno(rst.getString("hym_Classno15"));
                    banjiCourse.setBname(rst.getString("hym_Classname15"));
                    banjiCoursesList.add(banjiCourse);
                }
            }
            return banjiCoursesList;
        }catch (SQLException se ){
            se.printStackTrace();
            return null;
        }
    }

    //教师查询课程成绩排序
    public ArrayList<CourseReport> queryCourseReport(String cno){
        String sql="SELECT 学号" +
                "      ,姓名" +
                "      ,课程编号" +
                "      ,课程名称" +
                "      ,成绩" +
                "  FROM hym_TeacherRecord_View" +
                "  WHERE 课程名称=?" +
                "  ORDER BY 成绩 DESC";

        ArrayList<CourseReport> courseReportList = new ArrayList<CourseReport>();
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,cno);
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    CourseReport cr = new CourseReport();
                    cr.setCoursename(rst.getString("课程名称"));
                    cr.setSno(rst.getString("学号"));
                    cr.setSname(rst.getString("姓名"));
                    cr.setGrade(rst.getInt("成绩"));
                    cr.setCourseno(rst.getString("课程编号"));
                    courseReportList.add(cr);
                }
            }
            return courseReportList;
        }catch (SQLException se){
            se.printStackTrace();
            return  null;
        }
    }

    //查找开课学期
    public String findCterm(String cno){
        String sql = "SELECT hym_Cterm15 FROM huangym_Courses15 WHERE hym_Courseno15=?";
        String cterm = "";

        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, cno);
            ArrayList<String> list = new ArrayList<String>();
            try(ResultSet rst = pstmt.executeQuery()) {
                while (rst.next()) {
                     cterm = rst.getString("hym_Cterm15");
                }
            }
            return cterm;
        }catch (SQLException se){
            se.printStackTrace();
            return null;
        }
    }

    //查找课程名称
    public String findCname(String cno){
        String sql = "SELECT hym_Coursename15 FROM huangym_Courses15 WHERE hym_Courseno15=?";
        String cname = "";

        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, cno);
            ArrayList<String> list = new ArrayList<String>();
            try(ResultSet rst = pstmt.executeQuery()) {
                while (rst.next()) {
                    cname = rst.getString("hym_Coursename15");
                }
            }
            return cname;
        }catch (SQLException se){
            se.printStackTrace();
            return null;
        }
    }

    //插入新成绩记录
    public boolean addStudentCourseReport(String sno,String cno,String grade,String tno) {
        String sql = "INSERT INTO huangym_Grade15 VALUES(?,?,?,?,?)";
        SchoolDao dao = new SchoolDao();
        String cterm = dao.findCterm(cno);
//        String cname = dao.findCname(cno);
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, sno);
            pstmt.setString(2, cno);
            pstmt.setInt(3, Integer.parseInt(grade));
            pstmt.setString(4, tno);
//            pstmt.setString(4, cname);
            pstmt.setString(5, cterm);
            pstmt.executeUpdate();
            return true;
        } catch (SQLException se) {
            se.printStackTrace();
            return false;
        }
    }

    //教师课表查询
    public ArrayList<TeacherCourse> queryTeacherCourse(String tno){
        String sql = "SELECT DISTINCT 课程编号" +
                "      ,课程名称" +
                "      ,教师编号" +
                "      ,任课教师" +
                "  FROM hym_Statistic_View" +
                "  WHERE 教师编号=?";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1,tno);
            ArrayList<TeacherCourse> teacherCourseList = new ArrayList<TeacherCourse>();
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    TeacherCourse ts = new TeacherCourse();
                    ts.setCoursename(rst.getString("课程名称"));
                    ts.setTname(rst.getString("任课教师"));
                    ts.setCourseno(rst.getString("课程编号"));
                    ts.setTno(rst.getString("教师编号"));
                    teacherCourseList.add(ts);
                }
            }
            return teacherCourseList;
        }catch (SQLException se){
            se.printStackTrace();
            return  null;
        }

    }

    //查AVG成绩
    public ArrayList<AVG> queryCourseAVG(String cno) {
        String sql = "SELECT 课程编号" +
                "      ,平均成绩" +
                "  FROM hym_Avg_View" +
                "  WHERE 课程编号=?";
        ArrayList<AVG> avglist = new ArrayList<AVG>();
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, cno);
            try (ResultSet rst = pstmt.executeQuery()) {
                while (rst.next()) {
                    AVG avg = new AVG();
                    avg.setCourseno(rst.getString("课程编号"));
                    avg.setAvg(rst.getInt("平均成绩"));
                    avglist.add(avg);
                }
            }
            return avglist;
        } catch (SQLException se) {
            se.printStackTrace();
            return null;
        }
    }

    //学生按学期查询课程
    public ArrayList<StudentCourse> queryStudentCourse(String sno,String cterm){
        String sql="SELECT 学号" +
                "      ,姓名" +
                "      ,开设学期" +
                "      ,课程名称" +
                "      ,成绩" +
                "      ,任课教师" +
                "  FROM hym_Statistic_View" +
                "  WHERE 开设学期=? AND 学号=?";
        ArrayList<StudentCourse>studentCourseArrayList = new ArrayList<StudentCourse>();
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1,cterm);
            pstmt.setString(2,sno);
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    StudentCourse studentCourse = new StudentCourse();
                    studentCourse.setCoursename(rst.getString("课程名称"));
                    studentCourse.setSno(rst.getString("学号"));
                    studentCourse.setSname(rst.getString("姓名"));
                    studentCourse.setTname(rst.getString("任课教师"));
                    studentCourse.setCterm(rst.getString("开设学期"));
                    studentCourse.setGrade(rst.getInt("成绩"));
                    studentCourseArrayList.add(studentCourse);
                }
            }
            return studentCourseArrayList;
        }catch (SQLException se){
            se.printStackTrace();
            return null;
        }
    }

    //学生成绩查询个人
    public ArrayList<Studentgrade> queryStugrade(String bno){
        String sql = "SELECT * FROM hym_CourseGrade_View WHERE hym_Sname15=?";
        ArrayList<Studentgrade> studentgradesList = new ArrayList<Studentgrade>();
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,bno);
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    Studentgrade studentgrade = new Studentgrade();
                    studentgrade.setSname(rst.getString("hym_Sname15"));
                    studentgrade.setCoursename(rst.getString("hym_Coursename15"));
                    studentgrade.setTname(rst.getString("hym_Tname15"));
                    studentgrade.setGrade(rst.getString("hym_Grade15"));
                    studentgrade.setCterm(rst.getString("hym_Cterm15"));
                    studentgradesList.add(studentgrade);
                }
            }
            return studentgradesList;
        }catch (SQLException se ){
            se.printStackTrace();
            return null;
        }
    }

    //学生成绩查询所有人
    public ArrayList<Studentgrade> queryStugrade(){
        String sql = "SELECT * FROM hym_CourseGrade_View";
        ArrayList<Studentgrade> studentgradesList = new ArrayList<Studentgrade>();
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    Studentgrade studentgrade = new Studentgrade();
                    studentgrade.setSname(rst.getString("hym_Sname15"));
                    studentgrade.setCoursename(rst.getString("hym_Coursename15"));
                    studentgrade.setTname(rst.getString("hym_Tname15"));
                    studentgrade.setGrade(rst.getString("hym_Grade15"));
                    studentgrade.setCterm(rst.getString("hym_Cterm15"));
                    studentgradesList.add(studentgrade);
                }
            }
            return studentgradesList;
        }catch (SQLException se ){
            se.printStackTrace();
            return null;
        }
    }

    //查询所有学院
    public ArrayList<StuCollege> QueryAllCollege(){
        String sql = "SELECT * FROM huangym_Colleges15";
        ArrayList<StuCollege> collegeList = new ArrayList<StuCollege>();
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    StuCollege stucollege = new StuCollege();
                    stucollege.setCollegeno(rst.getString("hym_Collegeno15"));
                    stucollege.setCollegename(rst.getString("hym_Collegename15"));
                    collegeList.add(stucollege);
                }
            }
            return collegeList;
        }catch (SQLException se ){
            se.printStackTrace();
            return null;
        }
    }

    //查询指定学院
    public ArrayList<StuCollege> QueryCollege(String school_id){
        String sql = "SELECT * FROM huangym_Colleges15 WHERE hym_Collegeno15=?";
        ArrayList<StuCollege> collegeList = new ArrayList<StuCollege>();
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,school_id);
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    StuCollege stucollege = new StuCollege();
                    stucollege.setCollegeno(rst.getString("hym_Collegeno15"));
                    stucollege.setCollegename(rst.getString("hym_Collegename15"));
                    collegeList.add(stucollege);
                }
            }
            return collegeList;
        }catch (SQLException se ){
            se.printStackTrace();
            return null;
        }
    }

    //删除学院信息
    public boolean delCollege(String school_id){
        String sql = "DELETE FROM huangym_Colleges15 WHERE hym_Collegeno15=?";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,school_id);
            pstmt.executeUpdate();
            return true;
        }catch (SQLException se){
            se.printStackTrace();
            return false;
        }
    }

    //添加学院信息
    public boolean addCollege(String collegeno, String collegename){
        String sql = "INSERT INTO huangym_Colleges15 VALUES(?,?)";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,collegeno);
            pstmt.setString(2,collegename);
            pstmt.executeUpdate();
        }catch (SQLException se){
            se.printStackTrace();
            return false;
        }
        return true;
    }

    //修改学院信息
    public boolean modCollege(String collegeno, String collegename, String cnoold){
        String sql = "UPDATE huangym_Colleges15 SET hym_Collegeno15=?,hym_Collegename15=? WHERE hym_Collegeno15=?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,collegeno);
            pstmt.setString(2,collegename);
            pstmt.setString(3,cnoold);
            pstmt.executeUpdate();
        }catch (SQLException se){
            se.printStackTrace();
            return false;
        }
        return true;
    }

    //查询所有班级
    public ArrayList<StuClass> QueryAllClass(){
        String sql = "SELECT * FROM huangym_Class15";
        ArrayList<StuClass> stuClassList = new ArrayList<StuClass>();
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    StuClass stuClass = new StuClass();
                    stuClass.setClassno(rst.getString("hym_Classno15"));
                    stuClass.setClassname(rst.getString("hym_Classname15"));
                    stuClassList.add(stuClass);
                }
            }
            return stuClassList;
        }catch (SQLException se ){
            se.printStackTrace();
            return null;
        }
    }

    //查询指定班级
    public ArrayList<StuClass> QueryClass(String school_id){
        String sql = "SELECT * FROM huangym_Class15 WHERE hym_Classno15=?";
        ArrayList<StuClass> stuClassList = new ArrayList<StuClass>();
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,school_id);
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    StuClass stuClass = new StuClass();
                    stuClass.setClassno(rst.getString("hym_Classno15"));
                    stuClass.setClassname(rst.getString("hym_Classname15"));
                    stuClassList.add(stuClass);
                }
            }
            return stuClassList;
        }catch (SQLException se ){
            se.printStackTrace();
            return null;
        }
    }

    //删除班级信息
    public boolean delClass(String school_id){
        String sql = "DELETE FROM huangym_Class15 WHERE hym_Classno15=?";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,school_id);
            pstmt.executeUpdate();
            return true;
        }catch (SQLException se){
            se.printStackTrace();
            return false;
        }
    }

    //添加班级信息
    public boolean addClass(String classno, String classname){
        String sql = "INSERT INTO huangym_Class15 VALUES(?,?)";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,classno);
            pstmt.setString(2,classname);
            pstmt.executeUpdate();
        }catch (SQLException se){
            se.printStackTrace();
            return false;
        }
        return true;
    }

    //修改班级信息
    public boolean modClass(String classno, String classname, String cnoold){
        String sql = "UPDATE huangym_Class15 SET hym_Classno15=?,hym_Classname15=? WHERE hym_Classno15=?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,classno);
            pstmt.setString(2,classname);
            pstmt.setString(3,cnoold);
            pstmt.executeUpdate();
        }catch (SQLException se){
            se.printStackTrace();
            return false;
        }
        return true;
    }

    //查询所有专业
    public ArrayList<StuMajor> QueryAllMajor(){
        String sql = "SELECT * FROM hym_CollegeMajor_View";
        ArrayList<StuMajor> stuMajorList = new ArrayList<StuMajor>();
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    StuMajor stuMajor = new StuMajor();
                    stuMajor.setMno(rst.getString("hym_Mno15"));
                    stuMajor.setMname(rst.getString("hym_Mname15"));
                    stuMajor.setCollegename(rst.getString("hym_Collegename15"));
                    stuMajorList.add(stuMajor);
                }
            }
            return stuMajorList;
        }catch (SQLException se ){
            se.printStackTrace();
            return null;
        }
    }

    //查询指定专业
    public ArrayList<StuMajor> QueryMajor(String school_id){
        String sql = "SELECT * FROM hym_CollegeMajor_View WHERE hym_Mno15=?";
        ArrayList<StuMajor> stuMajorList = new ArrayList<StuMajor>();
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,school_id);
            try(ResultSet rst = pstmt.executeQuery()){
                while (rst.next()){
                    StuMajor stuMajor = new StuMajor();
                    stuMajor.setMno(rst.getString("hym_Mno15"));
                    stuMajor.setMname(rst.getString("hym_Mname15"));
                    stuMajor.setCollegename(rst.getString("hym_Collegename15"));
                    stuMajorList.add(stuMajor);
                }
            }
            return stuMajorList;
        }catch (SQLException se ){
            se.printStackTrace();
            return null;
        }
    }

    //删除专业信息
    public boolean delMajor(String school_id){
        String sql = "DELETE FROM huangym_Majors15 WHERE hym_Mno15=?";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,school_id);
            pstmt.executeUpdate();
            return true;
        }catch (SQLException se){
            se.printStackTrace();
            return false;
        }
    }

    //添加专业信息
    public boolean addMajor(String mno, String mname, String collegeno){
        String sql = "INSERT INTO huangym_Majors15 VALUES(?,?,?)";
        try(Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,mno);
            pstmt.setString(2,mname);
            pstmt.setString(3,collegeno);
            pstmt.executeUpdate();
        }catch (SQLException se){
            se.printStackTrace();
            return false;
        }
        return true;
    }

    //修改专业信息
    public boolean modMajor(String mno, String mname, String collegeno, String cnoold){
        String sql = "UPDATE huangym_Majors15 SET hym_Mno15=?,hym_Mname15=?,hym_Collegeno15=? WHERE hym_Mno15=?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setString(1,mno);
            pstmt.setString(2,mname);
            pstmt.setString(3,collegeno);
            pstmt.setString(4,cnoold);
            pstmt.executeUpdate();
        }catch (SQLException se){
            se.printStackTrace();
            return false;
        }
        return true;
    }


}
