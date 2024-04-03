# Exer 6: State Management

### Clarissa G. Rodriguez
- 2020-07354
- U-3L

### About the Application
- The application is a slambook which mainly accepts friend's name, nickname, age, relationship status, adulting happiness level, preferred superpower, and favorite motto. It uses Form widget with respective validation criteria. Upon a valid submission, the summary of the friend's data will be displayed. There's also a reset button that returns the fields and values to their initial states.

### Things I Did
- I used the `Form` widget to implement the slambook form. 
- For `text fields`, I ensured that the instructed validation is properly coded. Name and nickname text fields must not be empty. The age text field must be a valid number age.
- For relationship status `switch field`, I used the switch widget to show it at the frontend.
- For happiness level `slider field`, I used the slider widget and divided it to 9 divisions so it would render 1 to 10 scale.
- For superpower `dropdown field`, I used the dropdown widget and I mapped the given dropdown fields as their choices values.
- For favorite motto `radio buttons field`, I used the `RadioListTile`to map the values of the given data. I also ensured that if one radio button is clicked, it is the only one that'll be `true` while the rest will be `false`.


### Challenges in Developing the Application
- I had a hard time in showing the summary display properly. When I clicked the Done button, and given that the inputs are validated, then when I updated the non-text field values, the summary are shown immediately with the updated data without clicking the Done button again. I'm not pretty sure if this is really a bug, but I'd like to stick to the instructions as it is.
- So what I did is to add flaggers to each of the non-text fields which is setting the `isSummarized = false`. 
