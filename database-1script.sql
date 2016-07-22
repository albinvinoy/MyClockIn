-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Department` (
  `idDepartment` INT NOT NULL,
  `Depatment name` VARCHAR(45) NOT NULL,
  `Department Ph` INT(9) NOT NULL,
  PRIMARY KEY (`idDepartment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Employee ID`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Employee ID` (
  `First Name` VARCHAR(15) NOT NULL,
  `Last Name` VARCHAR(20) NOT NULL,
  `ID` INT(9) NOT NULL,
  `Phone Number` INT(10) NOT NULL,
  `Email` VARCHAR(40) NOT NULL,
  `Pay Rate` FLOAT NOT NULL,
  `username` VARCHAR(15) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `Security Level` CHAR(3) NOT NULL,
  `Notes` CHAR(200) NULL,
  `Department_idDepartment` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Employee ID_Department1_idx` (`Department_idDepartment` ASC),
  CONSTRAINT `fk_Employee ID_Department1`
    FOREIGN KEY (`Department_idDepartment`)
    REFERENCES `mydb`.`Department` (`idDepartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Time` (
  `Time in` TIMESTAMP NOT NULL,
  `Time out` TIMESTAMP NOT NULL,
  `Work / Abscent` TINYINT(1) NOT NULL,
  `Worked For` VARCHAR(45) NULL,
  `Work For ID` INT(9) NULL,
  `Employee ID_ID` INT(9) NOT NULL,
  `Total Hours` DATETIME NOT NULL,
  INDEX `fk_Time_Employee ID1_idx` (`Employee ID_ID` ASC),
  CONSTRAINT `fk_Time_Employee ID1`
    FOREIGN KEY (`Employee ID_ID`)
    REFERENCES `mydb`.`Employee ID` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
