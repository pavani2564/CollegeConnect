package service

import (
	"context"

	"github.com/jackc/pgx/v5/pgtype"
	db "github.com/pavani2564/CollegeConnect/backend/repo"
)

type TestService interface {
	GetHello() string
	CreateTest() map[string]bool
}

type Services struct {
	ctx context.Context
	DB  *db.Queries
}

func NewService(ctx context.Context, DB *db.Queries) *Services {
	return &Services{
		ctx,
		DB,
	}
}

func (s *Services) GetHello() string {
	return "Hello, World!"
}

func (s *Services) CreateTest() map[string]bool {
	test := db.CreateTestParams{
		Name: "test",
		Bio:  pgtype.Text{String: "I am test bio", Valid: true},
	}
	s.DB.CreateTest(s.ctx, test)

	return map[string]bool{
		"Success": true,
	}
}
