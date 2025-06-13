# 021Trade Orders Page – Interview Task
This Flutter page is intended to function as an "Open Orders" interface for a trading app. The aim was to design a neat, uniform, and intuitive interface for handling and displaying open orders, emphasizing code clarity and ease of maintenance. 

## My Approach

### 1. **Data Structure for Orders**
- Orders are kept in a list of maps, each holding information such as time, client, ticker, side, product, quantity, and price.
- This arrangement simplifies the sorting, displaying, and expanding of order information. 

### 2. **Sorting Functionality**
- Users can arrange orders based on client, quantity, or price with `ChoiceChip`s.
- The selected chip uses a highlighted color, while unselected chips remain white.
- Sorting direction is visually represented by an arrow icon.

### 4. **Action Buttons**
- The "Download" and "Cancel all" buttons have been designed to match the same dimensions and border radius as other UI components.
- This ensures visual harmony and a professional appearance.

### 5. **Market Information Bar**
- The upper bar shows important market indices in a horizontally scrollable line, designed with a light backdrop for emphasis.

### 6. **Order List Display**
- Orders are displayed in card-like frames with distinct separation and uniform padding. 
-  Every card features a two-column design to enhance the clarity of order information.
  
### 7. **Navigation Drawer**
- The end drawer provides quick navigation to other app sections.
- Each item is placed in a rounded container matching the overall design.

## Summary

This page demonstrates my ability to:
- Build consistent and modern Flutter UIs.
- Implement sorting and interactive features.
- Maintain clean, readable, and scalable code.
- Focus on both user experience and developer experience.

**Thank you for reviewing my work!**
