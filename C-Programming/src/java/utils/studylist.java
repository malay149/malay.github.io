/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

/**
 *
 * @author theth
 */
public class studylist {
        public String login;
	public int program_id;
	public String program_name;
        public int debug;
        public int run;
	// Parameterized Constructor to set Student
	// name, age, course enrolled in.

    public studylist(String login, int program_id, String program_name, int debug, int run) {
        this.login = login;
        this.program_id = program_id;
        this.program_name = program_name;
        this.debug = debug;
        this.run = run;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public int getProgram_id() {
        return program_id;
    }

    public void setProgram_id(int program_id) {
        this.program_id = program_id;
    }

    public String getProgram_name() {
        return program_name;
    }

    public void setProgram_name(String program_name) {
        this.program_name = program_name;
    }

    public int getDebug() {
        return debug;
    }

    public void setDebug(int debug) {
        this.debug = debug;
    }

    public int getRun() {
        return run;
    }

    public void setRun(int run) {
        this.run = run;
    }
        
	
}
