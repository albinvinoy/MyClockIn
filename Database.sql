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
-- Table `mydb`.`Employee ID`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Employee ID` (
  `First Name` VARCHAR(15) NOT NULL,
  `Last Name` VARCHAR(25) NOT NULL,
  `CWID` INT NOT NULL,
  `Phone Number` INT(11) NOT NULL,
  `Email` VARCHAR(40) NOT NULL,
  `Pay Rate` FLOAT NOT NULL,
  PRIMARY KEY (`CWID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Time` (
  `Time In` TIMESTAMP NOT NULL,
  `Time Out` TIMESTAMP NOT NULL,
  `Work/Abs` TINYINT(1) NOT NULL,
  `Worked For` VARCHAR(40) NULL,
  `Employee ID_CWID` INT NOT NULL,
  PRIMARY KEY (`Employee ID_CWID`),
  CONSTRAINT `fk_Time_Employee ID`
    FOREIGN KEY (`Employee ID_CWID`)
    REFERENCES `mydb`.`Employee ID` (`CWID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
