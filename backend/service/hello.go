package service

import (
	"database/sql"
	"log"

	"github.com/yourusername/yourapp/repo"
)

// CreateUser creates a new user in the database
func CreateUser(db *sql.DB, username, password string, isAdmin bool) error {
	var isAdminInt int
	if isAdmin {
		isAdminInt = 1
	} else {
		isAdminInt = 0
	}

	_, err := db.Exec("INSERT INTO users (username, password, is_admin) VALUES (?, ?, ?)", username, password, isAdminInt)
	return err
}

// MigrateTables migrates the database tables
func MigrateTables(db *sql.DB) {
	if err := repo.Migrate(db); err != nil {
		log.Fatalf("Error migrating tables: %v", err)
	}
}
