-- MySQL Script generated by MySQL Workbench
-- 10/05/15 16:08:17
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Task3_MySQLUniversity
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Task3_MySQLUniversity
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Task3_MySQLUniversity` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Task3_MySQLUniversity` ;

-- -----------------------------------------------------
-- Table `Task3_MySQLUniversity`.`Faculties`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Task3_MySQLUniversity`.`Faculties` (
  `FacultyId` INT NOT NULL COMMENT '',
  `Name` NVARCHAR(100) NOT NULL COMMENT '',
  PRIMARY KEY (`FacultyId`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Task3_MySQLUniversity`.`Departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Task3_MySQLUniversity`.`Departments` (
  `DepartmentId` INT NOT NULL COMMENT '',
  `Name` NVARCHAR(100) NOT NULL COMMENT '',
  `FacultyId` INT NOT NULL COMMENT '',
  PRIMARY KEY (`DepartmentId`)  COMMENT '',
  INDEX `fk_Departments_Faculties_idx` (`FacultyId` ASC)  COMMENT '',
  CONSTRAINT `fk_Departments_Faculties`
    FOREIGN KEY (`FacultyId`)
    REFERENCES `Task3_MySQLUniversity`.`Faculties` (`FacultyId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Task3_MySQLUniversity`.`Titles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Task3_MySQLUniversity`.`Titles` (
  `TitleId` INT NOT NULL COMMENT '',
  `Type` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`TitleId`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Task3_MySQLUniversity`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Task3_MySQLUniversity`.`Students` (
  `StudentId` INT NOT NULL COMMENT '',
  `Name` VARCHAR(45) NOT NULL COMMENT '',
  `Faculties_FacultyId` INT NOT NULL COMMENT '',
  PRIMARY KEY (`StudentId`)  COMMENT '',
  INDEX `fk_Students_Faculties1_idx` (`Faculties_FacultyId` ASC)  COMMENT '',
  CONSTRAINT `fk_Students_Faculties1`
    FOREIGN KEY (`Faculties_FacultyId`)
    REFERENCES `Task3_MySQLUniversity`.`Faculties` (`FacultyId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Task3_MySQLUniversity`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Task3_MySQLUniversity`.`Courses` (
  `CourseId` INT NOT NULL COMMENT '',
  `Name` VARCHAR(45) NOT NULL COMMENT '',
  `ProfessorId` INT NOT NULL COMMENT '',
  `Departments_DepartmentId` INT NOT NULL COMMENT '',
  PRIMARY KEY (`CourseId`)  COMMENT '',
  INDEX `fk_Courses_Departments1_idx` (`Departments_DepartmentId` ASC)  COMMENT '',
  CONSTRAINT `fk_Courses_Departments1`
    FOREIGN KEY (`Departments_DepartmentId`)
    REFERENCES `Task3_MySQLUniversity`.`Departments` (`DepartmentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Task3_MySQLUniversity`.`StudentsCourses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Task3_MySQLUniversity`.`StudentsCourses` (
  `Students_StudentId` INT NOT NULL COMMENT '',
  `Courses_CourseId` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Students_StudentId`, `Courses_CourseId`)  COMMENT '',
  INDEX `fk_StudentsCourses_Students1_idx` (`Students_StudentId` ASC)  COMMENT '',
  INDEX `fk_StudentsCourses_Courses1_idx` (`Courses_CourseId` ASC)  COMMENT '',
  CONSTRAINT `fk_StudentsCourses_Students1`
    FOREIGN KEY (`Students_StudentId`)
    REFERENCES `Task3_MySQLUniversity`.`Students` (`StudentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StudentsCourses_Courses1`
    FOREIGN KEY (`Courses_CourseId`)
    REFERENCES `Task3_MySQLUniversity`.`Courses` (`CourseId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Task3_MySQLUniversity`.`Professors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Task3_MySQLUniversity`.`Professors` (
  `ProfessorsId` INT NOT NULL COMMENT '',
  `Name` VARCHAR(45) NOT NULL COMMENT '',
  `Departments_DepartmentId` INT NOT NULL COMMENT '',
  PRIMARY KEY (`ProfessorsId`)  COMMENT '',
  INDEX `fk_Professors_Departments1_idx` (`Departments_DepartmentId` ASC)  COMMENT '',
  CONSTRAINT `fk_Professors_Departments1`
    FOREIGN KEY (`Departments_DepartmentId`)
    REFERENCES `Task3_MySQLUniversity`.`Departments` (`DepartmentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Task3_MySQLUniversity`.`ProfessorsCourses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Task3_MySQLUniversity`.`ProfessorsCourses` (
  `Courses_CourseId` INT NOT NULL COMMENT '',
  `Professors_ProfessorsId` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Professors_ProfessorsId`, `Courses_CourseId`)  COMMENT '',
  INDEX `fk_ProfessorsCourses_Courses1_idx` (`Courses_CourseId` ASC)  COMMENT '',
  INDEX `fk_ProfessorsCourses_Professors1_idx` (`Professors_ProfessorsId` ASC)  COMMENT '',
  CONSTRAINT `fk_ProfessorsCourses_Courses1`
    FOREIGN KEY (`Courses_CourseId`)
    REFERENCES `Task3_MySQLUniversity`.`Courses` (`CourseId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProfessorsCourses_Professors1`
    FOREIGN KEY (`Professors_ProfessorsId`)
    REFERENCES `Task3_MySQLUniversity`.`Professors` (`ProfessorsId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Task3_MySQLUniversity`.`ProfessorsTitles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Task3_MySQLUniversity`.`ProfessorsTitles` (
  `Professors_ProfessorsId` INT NOT NULL COMMENT '',
  `Titles_TitleId` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Titles_TitleId`, `Professors_ProfessorsId`)  COMMENT '',
  INDEX `fk_ProfessorsTitles_Professors1_idx` (`Professors_ProfessorsId` ASC)  COMMENT '',
  INDEX `fk_ProfessorsTitles_Titles1_idx` (`Titles_TitleId` ASC)  COMMENT '',
  CONSTRAINT `fk_ProfessorsTitles_Professors1`
    FOREIGN KEY (`Professors_ProfessorsId`)
    REFERENCES `Task3_MySQLUniversity`.`Professors` (`ProfessorsId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProfessorsTitles_Titles1`
    FOREIGN KEY (`Titles_TitleId`)
    REFERENCES `Task3_MySQLUniversity`.`Titles` (`TitleId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
