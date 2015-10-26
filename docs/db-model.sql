-- MySQL Script generated by MySQL Workbench
-- 10/26/15 08:25:29
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bodyconstruction
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bodyconstruction
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bodyconstruction` DEFAULT CHARACTER SET utf8 ;
USE `bodyconstruction` ;

-- -----------------------------------------------------
-- Table `bodyconstruction`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bodyconstruction`.`user` ;

CREATE TABLE IF NOT EXISTS `bodyconstruction`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `firstname` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `authmethod` VARCHAR(45) NULL,
  `password` VARCHAR(255) NULL,
  `journal_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bodyconstruction`.`journal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bodyconstruction`.`journal` ;

CREATE TABLE IF NOT EXISTS `bodyconstruction`.`journal` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_entered` DATETIME NOT NULL,
  `journalcol` VARCHAR(45) NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `weight_kg` FLOAT NULL,
  `BMI` FLOAT NULL,
  `body_fat_pct` FLOAT NULL,
  `waist_cm` FLOAT NULL,
  `arm_cm` FLOAT NULL,
  `neck_cm` FLOAT NULL,
  `chest_cm` FLOAT NULL,
  `hip_cm` FLOAT NULL,
  `thigh_cm` FLOAT NULL,
  `photo_uri` VARCHAR(255) NULL,
  PRIMARY KEY (`id`, `user_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_journal_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_journal_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `bodyconstruction`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
