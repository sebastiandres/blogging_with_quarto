-- Per-profile page titles.
--
-- This site is rendered twice (one build per language profile: esp, eng).
-- The body swaps via `content-visible when-profile=...`, but the YAML `title:`
-- is a single static string, so the title block / browser tab stay in the
-- profile-default language in every build.
--
-- This filter lets a page declare translated metadata alongside the default:
--
--   ---
--   title: "Sobre mí"
--   title-en: "About me"
--   description: "..."
--   description-en: "..."
--   ---
--
-- When the active profile is `eng`, `title`/`description`/`subtitle` are
-- replaced with their `-en` counterparts. Fields without an `-en` variant are
-- left untouched (they keep the default value).
function Meta(meta)
  local profile = os.getenv("QUARTO_PROFILE") or ""
  if profile:find("eng", 1, true) then
    for _, key in ipairs({ "title", "subtitle", "description" }) do
      if meta[key .. "-en"] ~= nil then
        meta[key] = meta[key .. "-en"]
      end
    end
  end
  return meta
end
