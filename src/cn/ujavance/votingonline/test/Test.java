package cn.ujavance.votingonline.test;

class Person {
    String name = "No name";
    public Person(String nm) {
        name = nm;
    }
     
}
class Employee extends Person {
    public Employee(String nm) {
        super(nm);
        // TODO Auto-generated constructor stub
        empID = nm;
    }
 
    String empID = "0000";
}
public class Test {
    public static void main(String args[]) {
        Employee e = new Employee("123");
        System.out.println(e.empID);
       
    }
}
