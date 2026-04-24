# Fluent Desktop Design Rules (NixOS / Linux Shell Concept)

## 1. Общая идея

Система не “rice”, а единая оболочка:

> **Fluent-like desktop environment inspired by Windows 11 + macOS glass aesthetics**

Фокус:

* ощущение “живого стекла”
* мягкая глубина
* единый визуальный язык во всей системе

---

## 2. Цветовая система (обязательная)

Единый токен-слой:

* Background (mica base): `#171A1F`
* Surface (elevated): `#1C2027`
* Foreground: `#E6EAF2`
* Border: `#2A2F3A`
* Accent (primary): `#6FA8FF`
* Accent soft: `#3D6FFF`

Правила:

* 1 акцентный цвет (синий)
* никаких неоновых/кислотных палитр
* контраст низкий, не “gaming UI”

---

## 3. Материальность (Fluent core)

Обязательные эффекты:

* blur (acrylic-like)
* semi-transparency (opacity ~0.85–0.95)
* мягкие тени (no hard shadows)
* ощущение “слоёв”

Запрещено:

* полностью непрозрачные панели (кроме редких исключений)
* резкие контуры без мягкости

---

## 4. Геометрия

* radius: 12–16px (основной стандарт)
* окна: rounded, floating
* отсутствие острых углов UI
* padding: воздушный (12–16px минимум)

---

## 5. WM / Layout (ключевой слой)

Модель:

* floating-first tiling (не строгий i3/awesome)
* визуально “плавающая сетка”
* окна не “приклеены”, а распределены в пространстве

Обязательные элементы:

* workspace-based workflow
* smooth animations (fade + scale)

---

## 6. Панель / Dock

Основная концепция:

* floating left sidebar (как заменитель taskbar)
* semi-transparent acrylic background
* blur + rounded capsule shape
* workspace indicator (вертикальный список точек/иконок)
* минимальные app icons

---

## 7. Шрифты

UI:

* Segoe UI (если доступен) или Inter

Mono:

* JetBrainsMono Nerd Font

Правило:

* UI ≠ coding font (разделение обязательно)

---

## 8. Терминал (Alacritty / others)

Поведение:

* часть системы, а не отдельное приложение
* opacity 0.85–0.9
* фон соответствует mica layer
* только один акцент (blue)
* приглушённая цветовая палитра

---

## 9. Theme architecture (важно для NixOS)

Все цвета и стили:

* вынесены в один theme module
* используются во всех компонентах:

  * WM
  * terminal
  * panel
  * GTK
  * Qt

Цель:

> единый дизайн-слой, а не набор разрозненных конфигов

---

## 10. UX ощущение (самое важное)

Система должна ощущаться как:

* “жидкое стекло поверх тёмного пространства”
* лёгкая, воздушная, не перегруженная
* единая визуальная ткань
* минимальный визуальный шум

---

## Если коротко (TL;DR)

> Fluent Linux = blur + rounded + floating + single accent + unified theme system
