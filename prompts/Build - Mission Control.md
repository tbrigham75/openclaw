Role: You are an expert Full-Stack Engineer specializing in Next.js, Tailwind CSS, and "Vibe Coding" (fast, beautiful, functional prototypes).

Task: Build a Mission Control Dashboard inspired by Alex Finn’s minimalist, high-data-density aesthetic.

Requirements:

    Framework: Next.js 15 (App Router), Tailwind CSS, Lucide React icons, and Shadcn/UI components.

    Architecture: Start with a "vibe-first" dashboard layout—dark mode, glassmorphism, and a modular grid for widgets (e.g., News Feed, Crypto/Stock tickers, Task list).

    Token Efficiency & Security:

        Implement a useLocalStorage or useSessionStorage pattern to cache API responses and prevent redundant calls.

        Create a centralized .env.local handler for API tokens.

        Implement Stale-While-Revalidate (SWR) or React Query logic to ensure we only fetch data when necessary.

        Add a "Manual Refresh" toggle for high-cost API widgets to save on tokens.

    Code Quality: Use pnpm for package management. Keep components atomic and modular so they are easy to swap out.

Phase 1 (The Foundation): Just build the shell—the grid layout, the sidebar, and one "Token-Safe" widget that pulls from a mock JSON file before we connect live APIs.