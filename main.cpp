#include <string.h>
#include <stdio.h>
#include <stdlib.h>

#define MAX_NAME_LENGTH 20
#define MAX_EMAIL_LENGTH 50
#define MAX_PHONE_NUMBER_LENGTH 15


// Structure for contact information
typedef struct {
    char name[MAX_NAME_LENGTH + 1];
    char email[MAX_EMAIL_LENGTH + 1];
    char phone_number[MAX_PHONE_NUMBER_LENGTH + 1];
} Contact;


// Function to validate email format
int isValidEmail(const char* email) {
    // Simple email format validation
    const char* at_pos = strchr(email, '@');
    if (at_pos == NULL) {
        return 0;
    }
    const char* dot_pos = strrchr(email, '.');
    if (dot_pos == NULL || dot_pos == at_pos + 1) {
        return 0;
    }
    return 1;
}


// Function to validate phone number format
int isValidPhoneNumber(const char* phone_number) {
    // Simple phone number format validation
    const char* digits = "0123456789";
    for (int i = 0; i < strlen(phone_number); i++) {
        if (strchr(digits, phone_number[i]) == NULL) {
            return 0;
        }
    }
    return 1;
}


// Function to add a contact to the phone book
void addContact(Contact* phone_book, int* num_contacts, const char* name, const char* email, const char* phone_number) {
    if (*num_contacts >= 8512) {
        printf("Phone book is full. Cannot add new contact.\n");
        return;
    }

    // Validate input
    if (strlen(name) > MAX_NAME_LENGTH || strlen(email) > MAX_EMAIL_LENGTH || strlen(phone_number) > MAX_PHONE_NUMBER_LENGTH) {
        printf("Invalid input. Name, email, and phone number cannot exceed %d characters.\n", MAX_NAME_LENGTH);
        return;
    }
    if (!isValidEmail(email) || !isValidPhoneNumber(phone_number)) {
        printf("Invalid input. Email and phone number must be valid.\n");
        return;
    }

    // Add contact to phone book
    strcpy(phone_book[*num_contacts].name, name);
    strcpy(phone_book[*num_contacts].email, email);

    // Remove leading and trailing spaces from phone number
    int start = 0, end = strlen(phone_number) - 1;
    while (start <= end && phone_number[start] == ' ') {
        start++;
    }
    while (start <= end && phone_number[end] == ' ') {
        end--;
    }
    strncpy(phone_book[*num_contacts].phone_number, phone_number + start, end - start + 1);
    phone_book[*num_contacts].phone_number[end - start + 1] = '\0';

    (*num_contacts)++;
    printf("Contact added successfully.\n");
}


// Function to search for a contact by name
void searchContactByName(const Contact* phone_book, int num_contacts, const char* name) {
    int found = 0;
    for (int i = 0; i < num_contacts; i++) {
        if (strcmp(phone_book[i].name, name) == 0) {
            printf("Contact found:\n");
            printf("Name: %s\n", phone_book[i].name);
            printf("Email: %s\n", phone_book[i].email);
            printf("Phone number: %s\n", phone_book[i].phone_number);
            found = 1;
            break;
        }
    }
    if (!found) {
        printf("Contact not found.\n");
    }
}


// Function to delete a contact by name
void deleteContactByName(Contact* phone_book, int* num_contacts, const char* name) {
    int found = 0;
    for (int i = 0; i < *num_contacts; i++) {
        if (strcmp(phone_book[i].name, name) == 0) {
            // Shift contacts to fill the gap
            for (int j = i; j < *num_contacts - 1; j++) {
                strcpy(phone_book[j].name, phone_book[j + 1].name);
                strcpy(phone_book[j].email, phone_book[j + 1].email);
                strcpy(phone_book[j].phone_number, phone_book[j + 1].phone_number);
            }
            (*num_contacts)--;
            found = 1;
            break;
        }
    }
    if (!found) {
        printf("Contact not found.\n");
    } else {
        printf("Contact deleted successfully.\n");
    }
    // Remove trailing spaces from phone numbers
    for (int i = 0; i < *num_contacts; i++) {
        int end = strlen(phone_book[i].phone_number) - 1;
        while (end >= 0 && phone_book[i].phone_number[end] == ' ') {
            end--;
        }
        phone_book[i].phone_number[end + 1] = '\0';
    }
}


int main() {
    const int MAX_CONTACTS = 10;
    Contact phone_book[MAX_CONTACTS];
    int num_contacts = 0;

    // Example usage
    addContact(phone_book, &num_contacts, "John Doe", "john.doe@example.com", "+1 123-456-7890");
    addContact(phone_book, &num_contacts, "Jane Smith", "jane.smith@example.com", "+1 987-654-3210");

    searchContactByName(phone_book, num_contacts, "John Doe");
    deleteContactByName(phone_book, &num_contacts, "Jane Smith");

    return 0;
}


