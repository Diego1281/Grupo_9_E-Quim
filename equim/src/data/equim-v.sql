-- MySQL Script generated by MySQL Workbench
-- Wed Oct 28 11:56:04 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema EQUIM-V
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema EQUIM-V
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EQUIM-V` DEFAULT CHARACTER SET utf8 ;
USE `EQUIM-V` ;

-- -----------------------------------------------------
-- Table `EQUIM-V`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EQUIM-V`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `avatar` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EQUIM-V`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EQUIM-V`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EQUIM-V`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EQUIM-V`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  `id_categoria` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_categoria_idx` (`id_categoria` ASC),
  CONSTRAINT `id_categoria`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `EQUIM-V`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EQUIM-V`.`carts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EQUIM-V`.`carts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NULL,
  `id_producto` INT NULL,
  `cantidad` INT NULL,
  `remito` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_usuario_idx` (`id_usuario` ASC),
  INDEX `id_producto_idx` (`id_producto` ASC),
  CONSTRAINT `id_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `EQUIM-V`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_producto`
    FOREIGN KEY (`id_producto`)
    REFERENCES `EQUIM-V`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
