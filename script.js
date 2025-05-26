// Get references to the HTML elements
const oldValueInput = document.getElementById('oldValue');
const newValueInput = document.getElementById('newValue');
const calculateBtn = document.getElementById('calculateBtn');
const resultDiv = document.getElementById('result');

// Function to perform the calculation
function calculatePercentageChange() {
    // 1. Get and parse input values
    const oldVal = parseFloat(oldValueInput.value);
    const newVal = parseFloat(newValueInput.value);

    // 2. Clear previous result styling
    resultDiv.textContent = ''; // Clear text content first
    resultDiv.classList.remove('success', 'decrease', 'error');
    // Reset to default placeholder style just in case
    resultDiv.style.color = '#7f8c8d';
    resultDiv.style.backgroundColor = '#ecf0f1';
    resultDiv.style.border = '1px dashed #bdc3c7';


    // 3. Validate inputs
    if (isNaN(oldVal) || isNaN(newVal)) {
        resultDiv.textContent = 'Please enter valid numbers in both fields.';
        resultDiv.classList.add('error');
        return; // Stop execution
    }

    // 4. Handle division by zero (special case)
    if (oldVal === 0) {
        if (newVal === 0) {
            resultDiv.textContent = 'No change (0%).';
            resultDiv.classList.add('success'); // Or maybe a neutral style
        } else {
            // Mathematically, change from 0 is infinite or undefined.
            resultDiv.textContent = 'Change from zero is undefined/infinite.';
             resultDiv.classList.add('error'); // Treat as an edge case/warning
        }
        return; // Stop execution
    }

    // 5. Calculate percentage change
    const change = ((newVal - oldVal) / oldVal) * 100;
    const absoluteChange = newVal - oldVal;

    // 6. Format the result
    const formattedChange = change.toFixed(2); // Format to 2 decimal places

    // 7. Display the result with appropriate styling
    let resultText = '';
    if (change > 0) {
        resultText = `Result: +${formattedChange}% (Increase)`;
        resultDiv.classList.add('success');
    } else if (change < 0) {
        // formattedChange will already have a minus sign
        resultText = `Result: ${formattedChange}% (Decrease)`;
        resultDiv.classList.add('decrease');
    } else {
        resultText = 'Result: 0.00% (No change)';
        resultDiv.classList.add('success'); // No change is generally neutral/good
    }

    resultDiv.textContent = resultText;
    // Remove the inline styles potentially set during reset
    resultDiv.style.color = '';
    resultDiv.style.backgroundColor = '';
    resultDiv.style.border = '';

}

// Add event listener to the button
calculateBtn.addEventListener('click', calculatePercentageChange);

// Optional: Allow calculation on pressing Enter in input fields
oldValueInput.addEventListener('keypress', function(event) {
    if (event.key === 'Enter') {
        calculatePercentageChange();
    }
});

newValueInput.addEventListener('keypress', function(event) {
    if (event.key === 'Enter') {
        calculatePercentageChange();
    }
});
