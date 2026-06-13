-- Per-profile page titles.
--
-- This site is rendered twice (one build per language profile: esp, eng).
-- The body swaps via `content-visible when-profile=...`, but the YAML `title:`
-- is a single static string, so the title block / browser tab stay in the
-- profile-default language in every build.
--
-- This filter lets a page declare a translated title alongside the default:
--
--   ---
--   title: "Sobre mí"
--   title-en: "About me"
--   ---
--
-- When the active profile is `eng`, `title` is replaced with `title-en`.
-- Pages without `title-en` are left untouched (they keep `title`).
function Meta(meta)
  local profile = os.getenv("QUARTO_PROFILE") or ""
  if profile:find("eng", 1, true) and meta["title-en"] ~= nil then
    meta.title = meta["title-en"]
  end
  return meta
end
